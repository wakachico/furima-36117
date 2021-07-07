# テーブル設計

## users テーブル

| Column           | Type    | Options                         |
| ---------------- | ------- | ------------------------------- |
| email            | string  | null: false                     |
| password         | string  | null: false                     |
| nickname         | string  | null: false                     |
| first_name       | string  | null: false                     |
| family_name      | string  | null: false                     |
| first_name_kana  | string  | null: false                     |
| family_name_kana | string  | null: false                     |
| birthday_year    | integer | null: false, length{ in: 4 }    |
| birthday_month   | integer | null: false, length{ in: 1..2 } |
| birthday_day     | integer | null: false, length{ in: 1..2 } |

### Association

- has_many :products
- has_many :comments
- has_many :buyers

## prototypes テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| product_image    | ActiveStorage |                                |
| product_name     | string        | null: false                    |
| product_text     | text          | null: false                    |
| product_category | text          | null: false                    |
| product_status   | text          | null: false                    |
| shipping_cost    | text          | null: false                    |
| shipping_area    | text          | null: false                    |
| shipping_time    | text          | null: false                    |
| selling_price    | integer       | null: false                    |
| user_id          | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :buyer

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## buyers テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| credit_card_number       | integer    | null: false, length{ in: 16 }   |
| effective_date_month     | integer    | null: false, length{ in: 1..2 } |
| effective_date_year      | integer    | null: false, length{ in: 2 }    |
| postal_code              | integer    | null: false, length{ in: 3..4 } |
| administrative_divisions | text       | null: false                     |
| municipalities           | text       | null: false                     |
| address                  | text       | null: false                     |
| building_name            | text       |                                 |
| phone_number             | integer    | null: false                     |
| user                     | references | null: false, foreign_key: true  |
| product                  | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :product