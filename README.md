# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| nickname           | string  | null: false              |
| first_name         | string  | null: false              |
| family_name        | string  | null: false              |
| first_name_kana    | string  | null: false              |
| family_name_kana   | string  | null: false              |
| birthday           | date    | null: false              |

### Association

- has_many :products
- has_many :comments
- has_many :purchases

## products テーブル

| Column              | Type          | Options                         |
| ------------------- | ------------- | ------------------------------- |
| name                | string        | null: false                     |
| text                | text          | null: false                     |
| category_id         | integer       | null: false                     |
| status_id           | integer       | null: false                     |
| shipping_cost_id    | integer       | null: false                     |
| area_id             | integer       | null: false                     |
| shipping_time_id    | integer       | null: false                     |
| selling_price       | integer       | null: false                     |
| user                | references    | null: false, foreign_key: true  |

### Association

- belongs_to             :user
- has_many               :comments
- has_one                :purchase
- belongs_to_active_hash :product_category
- belongs_to_active_hash :product_status
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :area
- belongs_to_active_hash :shipping_time

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## purchases テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| user                     | references | null: false, foreign_key: true  |
| product                  | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :address

## addresses テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| postal_code              | string     | null: false                     |
| area_id                  | integer    | null: false                     |
| municipalities           | string     | null: false                     |
| address                  | string     | null: false                     |
| building_name            | string     |                                 |
| phone_number             | string     | null: false                     |
| purchase                 | references | null: false, foreign_key: true  |

### Association

- belongs_to :purchase
- belongs_to_active_hash :area