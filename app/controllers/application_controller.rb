class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute1, :attribute2])
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute1, :attribute2])
  end
end
