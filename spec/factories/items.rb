FactoryBot.define do
  factory :item do
    title {""}
    category_id {Faker::Internet.free_email}
    price {""}
    item_description {""}
    status_id {""}
    shipping_fee_id {""}
    shipping_area_id {""}
    shipping_date_id {""}
    user {""}
  end
end   