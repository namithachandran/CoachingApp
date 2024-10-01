class Api::V1::CompaniesController < ApplicationController
    before_action :set_company, only: %i[show edit update destroy]

    def show
      @company = Company.find(params[:id])
      render json: @company, include: :coaching_programs
    end
  
    private
  
    def set_company
      @company = Company.find(params[:id])
    end

  end
  