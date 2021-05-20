class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @purchase_record_shipping = PurchaseRecordShipping.new
    @items = Item.find(params[:item_id])
    if current_user.id == @items.user_id || @items.purchase_record != nil
      redirect_to root_path 
    end
  end

  def create
    @items = Item.find(params[:item_id])
    @purchase_record_shipping = PurchaseRecordShipping.new(purchase_record_shipping_params)
    if @purchase_record_shipping.valid?
      pay_item
      @purchase_record_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
    def purchase_record_shipping_params
      params.require(:purchase_record_shipping).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge( item_id: params[:item_id] , user_id: current_user.id, token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @items.price,
        card: purchase_record_shipping_params[:token], 
        currency: 'jpy'
      )
    end
end
