FactoryBot.define do
  factory :purchase_record do
    postal_code {111-2222}
    shipping_area_id {2}
    municipality {あいうえお}
    address {かきくけこ1-1}
    building_name {さしすせそ101}
    phone_number {01000001111}
    purchase_record_id {2}
    item_id {2}
    user_id {2}

    association :user, :item, :shipping

  end
end
