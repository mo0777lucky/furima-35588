class Item < ApplicationRecord
  validates :title, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :item_description, presence: true
  validates :status_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_date_id, presence: true
  validates :user, presence: true

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
end
