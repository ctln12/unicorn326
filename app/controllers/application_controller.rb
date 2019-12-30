class ApplicationController < ActionController::Base
  before_action :authenticate_tutor!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:phone_number, :photo_url, :subjects, :spoken_languages, :currency, :price])
  end
end
