class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params.dig(:session, :email))
    if user && user.authenticate(params.dig(:session, :password))
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out successfully."
  end

  # Modify the respond_with method to accept one argument
  private

  def respond_with(resource)
    if resource.present?
      render json: resource
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
