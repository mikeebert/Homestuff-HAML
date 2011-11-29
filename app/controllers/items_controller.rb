class ItemsController < ApplicationController

  before_filter :current_user
  
  def index
    @items = @user.items.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = @user.items.build(params[:item])
    
    if @item.save
      redirect_to items_url, notice: "Item successfully created."
    else
      render :new, notice: "There was an error creating your item. Please try again."
    end
    
  end
  
  def show
    @item = @user.items.find(params[:id])
  end
  
  def edit
    @item = @user.items.find(params[:id])      
  end
  
  def update
    @item = @user.item.find(params[:id])
    @item.update_attributes(params[:item])
    
    if @item.save
      redirect_to items_url, notice: "Item successfully updated."
    else
      render :new, notice: "There was an error saving your item. Please try again."
    end    
  end
  
  def destroy
    @item = @user.item.find(params[:id])
    @item.destroy
    redirect_to items_url, notice: "Item has been deleted."
  end
  
end
