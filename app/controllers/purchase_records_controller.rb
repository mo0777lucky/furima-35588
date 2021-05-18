class PurchaseRecordsController < ApplicationController

  def index
    @purchase_record_shipping = PurchaseRecordShipping.new
  end

  def create
    @purchase_record_shipping = PurchaseRecordShipping.new(purchase_record_shipping_params)
    if @purchase_record_shipping.valid?
      @purchase_record_shipping.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
    def purchase_record_shipping_params
      params.require(:purchase_record_shipping).permit(:postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :item_id, :purchase_record_id).merge(user_id: current_user.id)
    end
end
