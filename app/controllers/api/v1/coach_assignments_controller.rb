class Api::V1::CoachAssignmentsController < ApplicationController
    def create
      @coaching_program = CoachingProgram.find(params[:coaching_program_id])
      @coach_assignment = @coaching_program.coach_assignments.build(coach_assignment_params)
  
      if @coach_assignment.save
        render json: { message: 'Coach assigned successfully' }, status: :created
      else
        render json: { errors: @coach_assignment.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def coach_assignment_params
      params.require(:coach_assignment).permit(:coach_id)
    end
  end
  