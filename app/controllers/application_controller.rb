class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource) if is_navigational_format?
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_users_path
    else
      posts_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
  end

end
