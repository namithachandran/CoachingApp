class Employees::SessionsController < Devise::SessionsController
  before_action :require_no_authentication, only: [:new, :create]

  def create
    super do |resource|
      if resource.persisted?
        redirect_to landing_employee_path(resource) and return
      end
    end
  end

  private

  def require_no_authentication
    #to override path
  end
end
  


  