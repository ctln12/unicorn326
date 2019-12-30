class ApplicationController < ActionController::Base
  before_action :authenticate_student!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country, :date_of_birth, :phone_number, :photo_url])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country, :date_of_birth, :phone_number, :photo_url])
  end
end
