class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :category_id, :price, :item_description, :status_id, :shipping_fee_id, :shipping_area_id, :shipping_date_id, :user)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end