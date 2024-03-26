# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    # Output email and password parameters for debugging
    puts "Email: #{params.dig(:session, :email)}"
    puts "Password: #{params.dig(:session, :password)}"

    user = User.find_by(email: params.dig(:session, :email))
    if user
      # Output user found for debugging
      puts "User found: #{user.inspect}"

      if user.authenticate(params.dig(:session, :password))
        # Output successful authentication for debugging
        puts "Authentication successful for user: #{user.inspect}"

        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in successfully."
      else
        # Output authentication failure for debugging
        puts "Authentication failed for user: #{user.inspect}"

        redirect_to login_path, notice: "Invalid email or password"
        flash.now[:alert] = "Invalid email or password"
        @error_message = "Invalid email or password"
        puts "Flash alert: #{flash.now[:alert]}" # Debug statement
        puts "Error message: #{@error_message}"   # Debug statement
        # render :new
      end
    else
      # Output user not found for debugging
      puts "User not found for email: #{params.dig(:session, :email)}"

      redirect_to login_path, notice: "Invalid email or password"
      flash.now[:alert] = "Invalid email or password"
      @error_message = "Invalid email or password"
      puts "Flash alert: #{flash.now[:alert]}" # Debug statement
      puts "Error message: #{@error_message}"   # Debug statement
      # render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out successfully."
  end
end
