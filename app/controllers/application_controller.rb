class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end


def after_sign_in_path_for(resource)
    flash[:notice] = "Signed in successfully."
    user_path(current_user.id)
end
def after_sign_up_for(resource)
    flash[:notice] = "Welcome! You have signed up successfully."
    user_path(current_user.id)
end

def after_sign_out_for(resource)
    flash[:notice] = "Signed out successfully."
    root_path
end

end
