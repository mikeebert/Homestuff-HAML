class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:uid] = user.id
      redirect_to root_url, notice: "Welcome back, #{user.first_name}. Thank you for logging in."
    else
      redirect_to new_user_url, notice: "Login failed. Please try again or create an account."
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url
  end
  
end