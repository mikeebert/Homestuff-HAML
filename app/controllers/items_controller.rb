class ItemsController < ApplicationController

  before_filter :require_user
  autocomplete :item, :name, :full => true, :autofocus => true
  
  def index
    # @items = @user.items.scoped
    @items = @user.items

    if params[:field].present?
      search_term = params[:field][:item_name]
      @items = @items.where('name like ?', "%#{search_term}%")
    end

    if params[:category]
      @items = @items.where(:category_id => params[:category])
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

    respond_to do |format|
      if @item.destroy
        format.html {redirect_to items_url, notice: "Item has been deleted."}
        format.js
      else
        format.html {render :index, notice: "Error deleting item."}
      end
    end
  end
  
end
