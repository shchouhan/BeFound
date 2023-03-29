class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?, only: [:create]
  before_action :configure_permitted_parameters_update, if: :devise_controller?, only: [:update]
  
  
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image,
                                                       :user_name,
                                                       :email,
                                                       :encrypted_password,
                                                       :reset_password_token,
                                                       :qualification,
                                                       :contact,
                                                       :address,
                                                       :user_type])

  end   
  def configure_permitted_parameters_update
    
    devise_parameter_sanitizer.permit(:account_update, keys: [:image,
                                                       :user_name,
                                                       :email,
                                                       :encrypted_password,
                                                       :reset_password_token,
                                                       :qualification,
                                                       :contact,
                                                       :address,
                                                       :user_type])

  end  
end
