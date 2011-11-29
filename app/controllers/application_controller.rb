class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :logged_in?
  
  def current_user
    @user = User.find(session[:uid])
  end
  
  def logged_in?
    if session[:uid].present?
      @user = current_user
    end
  end
  
end
