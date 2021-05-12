class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_date

  with_options presence: true do
    validates :title
    validates :price
    validates :item_description
    validates :user
  end

  with_options presence: true do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_date_id
  end

  validates :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :shipping_date_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
end
