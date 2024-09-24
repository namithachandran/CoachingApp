class Api::V1::CoachingProgramsController < ApplicationController

    skip_before_action :verify_authenticity_token
  
    def join
        employee = Employee.find(params[:employee_id])
        program = CoachingProgram.find(params[:program_id])

        # Create new enrollment for the employee and coaching program
        enrollment = EmployeeEnrollment.new(employee: employee, coaching_program: program)

        if enrollment.save
          render json: { message: 'Successfully joined the program', enrollment: enrollment }, status: :created
        else
          render json: { errors: enrollment.errors.full_messages }, status: :unprocessable_entity
        end
      end
  end
  