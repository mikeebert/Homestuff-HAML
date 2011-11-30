class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :logged_in?

  def logged_in?
    if session[:uid].present?
      @user = User.find(session[:uid])
    end
  end
    
  def require_user
    redirect_to new_user_url unless logged_in?
  end
  
end
