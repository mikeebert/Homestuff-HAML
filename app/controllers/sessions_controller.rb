class SessionsController < ApplicationController
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:uid] = user.id
      redirect_to root_url, notice: "Welcome back, #{user.id}. Thank you for logging in."
    else
      render :new, notice: "Please try again."
    end
  end
  
  def destroy
  end
  
end