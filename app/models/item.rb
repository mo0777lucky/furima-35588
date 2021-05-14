class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_date

  with_options presence: true do
    validates :title
    validates :item_description
    validates :image
  end

  with_options presence: true, format: {with: /\A[0-9]+\d\z/, message: "is invalid"} do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end

  validates :category_id, :status_id, :shipping_fee_id, :shipping_area_id, :shipping_date_id, presence: true, numericality: { other_than: 1 }

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  #validates :content, presence: true, unless: :was_attached?

  #def was_attached?
    #self.image.attached?
  #end

end
