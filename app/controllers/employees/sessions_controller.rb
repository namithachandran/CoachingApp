class Employees::SessionsController < Devise::SessionsController

    def create
      super do |resource|
        if resource.persisted?
          redirect_to landing_employee_path(resource) and return
        end
      end
    end
  end
  