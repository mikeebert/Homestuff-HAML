class ItemsController < ApplicationController

  before_filter :require_user
  
  def index
    @items = @user.items.scoped

    if params[:category]
      @items = @items.where(:category_id => params[:category]).page(params[:page]).per(10)      
    end

    if params[:item]
       search_term = params[:item]
       @items = @items.where("name LIKE ?", "%#{search_term}%").page(params[:page]).per(10)
    end
    
    @items = @items.order("name ASC").page(params[:page]).per(10)
    @item = Item.new
    
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
    
    respond_to do |format|
      format.js #:format => nil
      format.html
    end
          
  end
  
  def update
    puts @user.inspect
    @item = @user.items.find(params[:id])
    @item.update_attributes(params[:item])

    if @item.save
      redirect_to items_url, notice: "Item successfully updated."
      # respond_to do |format|
      #         format.js
      #       end
    else
      render :new, notice: "There was an error saving your item. Please try again."
    end    
  end
  
  def destroy
    @item = @user.items.find(params[:id])
    @item.destroy
    redirect_to items_url, notice: "Item has been deleted."
  end
  
end
