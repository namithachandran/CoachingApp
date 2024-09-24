class Api::V1::CoachDashboardController < ApplicationController
    def index
      @coach = Coach.find(params[:coach_id])
      @coaching_programs = @coach.coaching_programs.includes(:employees)
      render json: @coaching_programs, include: :employees
    end
  end
  