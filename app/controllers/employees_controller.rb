class EmployeesController < ApplicationController
    before_action :authenticate_employee!
  
    def show
      @employee = Employee.find(params[:id])
    end
  
    def landing
      @employee = current_employee
    end
  end
  