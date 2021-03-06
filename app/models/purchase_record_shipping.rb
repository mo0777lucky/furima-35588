class PurchaseRecordShipping
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は不正な値です"}
    validates :shipping_area_id, numericality: {other_than: 1}
    validates :phone_number, format: {with: /\A(0{1}\d{9,10})\z/, message: "は不正な値です"}
  end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
