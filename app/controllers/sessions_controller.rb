class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:uid] = user.id
      redirect_to user, notice: "Welcome back, #{user.first_name}. Thank you for logging in."
    else
      render :new, notice: "Please try again."
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url, notice: "You have successfully logged out."
  end
  
end