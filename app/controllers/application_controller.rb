# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      flash[:alert] = "You must be logged in"
      redirect_to login_path
    end
  end
end
