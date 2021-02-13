# テーブル設計

## users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| name     | string | null: false,              |
| nickname | string | null: false, unique: true |
| email    | string | null: false, unique: true |
| password | string | null: false,              |
| furigana | string | null: false               |
| birthday | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category     | string     | null: false                    |
| state        | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| area         | string     | null: false                    |
| days         | integer    | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| municipality       | string     | null: false                    |
| house_number       | integer    | null: false                    |
| phone_number       | integer    | null: false                    |
| purchase_record_id | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record

## purchase_records テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address