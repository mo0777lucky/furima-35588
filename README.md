# README


## Users Tabel

| Column                | Type   | Options      |
| --------------------- | ------ | ------------ |
| nickname              | string | null: false  |
| email                 | string | unique: true |
| encrypted_password    | string | null: false  |
| last_name_kanji       | string | null: false  |
| first_name_kanji      | string | null: false  |
| last_name_kana        | string | null: false  |
| first_name_kana       | string | null: false  |
| date                  | string | null: false  |

### Association
- has_many :Items
- has_many :Purchase records





## Items Tabel

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| category      | integer    | null: false                    |
| price         | integer    | null: false                    |
| status        | integer    | null: false                    |
| shipping_fee  | integer    | null: false                    |
| shipping_area | integer    | null: false                    |
| shipping_date | integer    | null: false                    |
| seller_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :User
- has_one :Purchase record
- belongs_to :Shipping information





## Purchase record Tabel

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| buyer_id | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :User
- belongs_to :Item
- has_one:Shipping information





## Shipping information Tabel

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_code   | string | null: false |
| prefectures   | string | null: false |
| municipality  | string | null: false |
| address       | string | null: false |
| building_name | string |             |
| phone_number  | string | null: false |

### Association
- has_many :Items
- belongs_to:Purchase record