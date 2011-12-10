class UsersController < ApplicationController
  
  # before_filter :current_user
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:uid] = @user.id
      redirect_to items_url, notice: "Account successfully created! Get started by adding your items below."
    else
      render :new, notice: "There was an error creating your account. Please try again."
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to @user, notice: "Account updated."    
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_url, notice: "Your account has been deleted"
  end
  
end 