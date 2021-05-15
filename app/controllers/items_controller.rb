class ItemsController < ApplicationController
 
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show,:edit, :update]
  before_action :set_message, only: [:edit, :update]
  
  def index
    @items = Item.order("created_at DESC")
  end

  def show
  end


  def new
    @items = Item.new
  end


  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
  end


  def update
    if @items.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :title, :category_id, :price, :item_description, :status_id, :shipping_fee_id, :shipping_area_id, :shipping_date_id).merge(user_id: current_user.id)
  end


  def set_item
    @items = Item.find(params[:id])
  end


  def set_message
    if current_user.id != @items.user_id
      redirect_to root_path
    end
  end
end
