class Api::V1::EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :index]

  def index
    # Fetch coaching programs assigned to the current employee
    @employee = Employee.find(params[:employee_id])
    @coaching_programs = @employee.coaching_programs.includes(:coach)
    render json: @coaching_programs, include: :coach
  end

  def create
    company = Company.find(params[:company_id])
    employee = company.employees.new(employee_params)

    if employee.save
      render json: employee, status: :created
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def programs_with_coaches
    coaching_programs = CoachingProgram.where.not(coach_assignments: nil)
    render json: coaching_programs.as_json(include: { coaches: { only: [:id, :name] } })
    end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password, :password_confirmation)
  end
end
