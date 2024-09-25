class CoachesController < ApplicationController
    before_action :authenticate_coach!
  
    def show
      @coach = Coach.find(params[:id])
    end
  
    def dashboard
      @coach = current_coach
    end
  end