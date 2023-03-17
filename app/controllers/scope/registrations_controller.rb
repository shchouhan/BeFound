# frozen_string_literal: true

class Scope::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

 



  #PUT /resource
  def update
   #super
    byebug
    current_user.update(configure_account_update_params)
    redirect_to edit_user_registration_path(current_user)#, notice: 'Profile has been updated successfully!'
   # else
   #    render :edit
   #   # render plain: "OK"
   # end
  end


  #protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  #If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
