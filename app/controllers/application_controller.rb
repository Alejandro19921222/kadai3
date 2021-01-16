class ApplicationController < ActionController::Base
   before_action :authenticate_user!,except: [:top]
   before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end

def after_new_user_session_path_for(resources)
  if current_user
    flash[:notice] = "Signed in successfully."
    user_path(current_user)
  else
    new_user_session_path
  end
end

def after_new_user_registration_path_for(resources)
    flash[:notice] = "Welcome! You have signed up successfully."
    user_path(current_user)
end