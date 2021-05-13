FactoryBot.define do
  factory :item do
    title {"帽子"}
    category_id {2}
    price {3500}
    item_description {"あああああああああああああああああ"}
    status_id {2}
    shipping_fee_id {2}
    shipping_area_id {2}
    shipping_date_id {2}
    user_id {2}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end   