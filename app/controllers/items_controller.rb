class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
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


  def show
    @items = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:image, :title, :category_id, :price, :item_description, :status_id, :shipping_fee_id, :shipping_area_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
