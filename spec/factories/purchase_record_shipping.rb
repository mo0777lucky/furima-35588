FactoryBot.define do
  factory :purchase_record_shipping do
    postal_code {"123-1122"}
    shipping_area_id {2}
    municipality {"あいうえお"}
    address {"かきくけこ1-1"}
    building_name {"さしすせそ101"}
    phone_number {"00012345670"}
    token {"tok_abcdefghijk00000000000000000"}
   end
end

