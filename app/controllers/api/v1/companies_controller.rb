class Api::V1::CompaniesController < ApplicationController
    before_action :set_company, only: %i[show edit update destroy]
  
    def index
      @companies = Company.all
    end
  
    def show
      @company = Company.find(params[:id])
      render json: @company, include: :coaching_programs
    end
  
    def new
      @company = Company.new
    end
  
    def create
      @company = Company.new(company_params)
      if @company.save
        redirect_to @company, notice: 'Company was successfully created.'
      else
        render :new
      end
    end
  
    def edit; end
  
    def update
      if @company.update(company_params)
        redirect_to @company, notice: 'Company was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @company.destroy
      redirect_to companies_url, notice: 'Company was successfully destroyed.'
    end
  
    private
  
    def set_company
      @company = Company.find(params[:id])
    end
  
    def company_params
      params.require(:company).permit(:name, :description)
    end
  end
  