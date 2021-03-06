class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name])
  end

  def after_sign_in_path_for(resource)
  	if resource.is_admin == false
  		videos_path
  	else
  		user_index_path 	
    end
	end
end



