FactoryBot.define do
  factory :user do
    nickname {"morimori"}
    email {Faker::Internet.free_email}
    password {"mo1234"}
    password_confirmation {"mo1234"}
    last_name_kanji {"山田"}
    first_name_kanji {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday {"2021/05/10"}
  end
end