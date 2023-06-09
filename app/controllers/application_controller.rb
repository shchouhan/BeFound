class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?, only: [:create]
  before_action :configure_permitted_parameters_update, if: :devise_controller?, only: [:update]

  before_action :authenticate_user!
  # load_and_authorize_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,
                                                       :email,
                                                       :encrypted_password,
                                                       :reset_password_token,
                                                       :contact,
                                                       :address,
                                                       :user_type])

  end   
  def configure_permitted_parameters_update
    
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name,
                                                       :email,
                                                       :encrypted_password,
                                                       :reset_password_token,
                                                       :contact,
                                                       :address,
                                                       :user_type])

  end  
end
