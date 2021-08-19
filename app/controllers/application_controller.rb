class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profession])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :experience, :home, :license, :profile_image])
  end
end
  
  private

  # def after_sign_out_path_for(resource_or_scope)
  #   root_path 
  # end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      redirect_to new_user_session_url
    end
  end