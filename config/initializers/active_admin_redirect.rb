
ActiveAdmin::BaseController.class_eval do
    def after_sign_in_path_for(resource)
        admin_admin_users_path  # Redirect to Admin Users page
    end
  end
  