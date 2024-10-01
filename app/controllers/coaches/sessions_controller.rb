class Coaches::SessionsController < Devise::SessionsController
  before_action :require_no_authentication, only: [:new, :create]
  
  def create
      #redirect to employee landing page after sign in
      super do |resource|
        if resource.persisted?
          redirect_to dashboard_coach_path(resource) and return
        end
      end
    end

    private

    def require_no_authentication
      #to override path
    end
  end
  