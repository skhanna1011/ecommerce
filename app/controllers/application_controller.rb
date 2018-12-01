class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller? 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :mobile, :gender, :dob])
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :mobile, :gender, :dob])
  end

  def check_is_admin
    if current_user.is_admin
      return true
    else
      redirect_to root_path, notice: "The page you are looking for doesn't exists"
    end
  end
end