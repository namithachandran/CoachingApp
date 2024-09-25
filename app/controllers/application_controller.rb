class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(AdminUser)
      admin_admin_users_path
    else
      super
    end
  end
end
