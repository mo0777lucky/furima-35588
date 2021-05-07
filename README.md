# README


## Users Tabel

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name_kanji       | string | null: false               |
| first_name_kanji      | string | null: false               |
| last_name_kana        | string | null: false               |
| first_name_kana       | string | null: false               |
| birthday              | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_records





## Items Tabel

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| category_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| item_description | text       | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| seller           | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record
- belongs_to :shipping_information





## Purchase_record Tabel

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| buyer  | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one:shipping_information





## Shipping_information Tabel

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

### Association
- has_many :items
- belongs_to:purchase_record