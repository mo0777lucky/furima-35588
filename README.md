# README


## Users Tabel

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| name_full_kanji       | string | null: false |
| name_full_kana        | string | null: false |
| birthday              | string | null: false |

### Association
- has_many :Items
- has_many :Purchase record
- belongs_to :Shipping information





## Items Tabel

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| image         |            |                                |
| category      | string     | null: false                    |
| price         | string     | null: false                    |
| status        | text       | null: false                    |
| shipping_fee  | string     | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_date | string     | null: false                    |
| seller        | references | null: false, foreign_key: true |

### Association
- belongs_to :Users
- has_one :Purchase record
- belongs_to :Shipping information





## Purchase record Tabel

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buyer   | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :Users
- belongs_to :Items
- has_one:Shipping information





## Shipping information Tabel

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_code   | string | null: false |
| prefectures   | string | null: false |
| municipality  | string | null: false |
| address       | string | null: false |
| building_name | string | null: false |
| phone_number  | string | null: false |

### Association
- belongs_to :Users
- has_many :Items
- belongs_to:Purchase record