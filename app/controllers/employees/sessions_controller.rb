class Employees::SessionsController < Devise::SessionsController

  def create
    #redirect to employee landing page after sign in
    super do |resource|
      if resource.persisted?
        redirect_to landing_employee_path(resource) and return
      end
    end
  end
end
