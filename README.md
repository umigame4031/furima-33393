# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| family_name_furigana | string | null: false               |
| first_name_furigana  | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| state_id        | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| days_id         | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| area_id            | integer    | null: false                    |
| municipality       | string     | null: false                    |
| house_number       | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| purchase_record    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record

## purchase_records テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address