class Api::V1::EmployeeEnrollmentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
  
    def create
      # Find employee and coaching programs
      employee = Employee.find(params[:employee_id])
      coaching_program = CoachingProgram.find(params[:program_id])
  
      # Create a new employee enrollment
      enrollment = EmployeeEnrollment.new(employee: employee, coaching_program: coaching_program)
  
      if enrollment.save
        render json: { message: 'Enrollment successful', enrollment: enrollment }, status: :created
      else
        render json: { errors: enrollment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
  