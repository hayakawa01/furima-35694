# データベース設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth_date      | integer | null: false |

### Association
- has_many :items
- has_many :buyers
- has_many :comments


## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null: false                   |
| detail          | text       | null: false                   |
| category        | string     | null: false                   |
| condition       | string     | null: false                   |
| delivery_charge | string     | null: false                   |
| delivery_time   | string     | null: false                   |
| prefecture      | string     | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer
- has_many :comments

## buyers テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postal_code   | integer    | null: false                   |
| prefecture    | string     | null: false                   |
| municipality  | string     | null: false                   |
| address       | string     | null: false                   |
| building_name | string     |                               |
| phone_number  | integer    | null: false                   |
| item          | references | null: false,foreign_key: true |
| user          | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

