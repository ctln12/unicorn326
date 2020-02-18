class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters_student, if: :devise_controller?
  before_action :configure_permitted_parameters_tutor, if: :devise_controller?

  protected

  def configure_permitted_parameters_student
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :country, :date_of_birth, :phone_number, :photo_url])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :country, :date_of_birth, :phone_number, :photo_url])
  end

  def configure_permitted_parameters_tutor
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :phone_number, :photo_url, :subjects, :spoken_languages, :currency_id, :price])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:phone_number, :photo_url, :subjects, :spoken_languages, :currency_id, :price])
  end
end
