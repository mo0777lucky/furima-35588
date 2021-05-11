FactoryBot.define do
  factory :purchase_record do
    content {Faker::Lorem.sentence}
    association :user
    association :item
  end
end