class Coaches::SessionsController < Devise::SessionsController
    def create
        #redirect to employee landing page after sign in
        super do |resource|
          if resource.persisted?
            redirect_to dashboard_coach_path(resource) and return
          end
        end
      end
  end
  