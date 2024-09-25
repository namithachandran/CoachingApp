class Api::V1::CoachDashboardController < ApplicationController
  before_action :authenticate_coach!

  def index
    @coach = Coach.find(params[:coach_id])
    @coaching_programs = @coach.coaching_programs
                               .left_joins(:employee_enrollments)
                               .select('coaching_programs.*, COUNT(employee_enrollments.id) AS employees_count')
                               .group('coaching_programs.id')
    render json: @coaching_programs
  end
end
