### テーブル設計

## Usersテーブル

|  Column    |  Type   |  Options    |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| year       | integer | null: false |
| month      | integer | null: false |
| day        | integer | null: false |

# Association
- has_many :items
- has_many :orders

## Itemsテーブル
|  Column   |  Type      |  Options                       |
| --------- | ---------- | ------------------------------ |
| item      | string     | null: false                    |
| text      | text       | null: false                    |
| price     | integer    | null: false                    |
| category  | string     | null: false                    |
| status    | string     | null: false                    |
| charge    | string     | null: false                    |
| area      | string     | null: false                    |
| days      | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |

# Association
- has_one :order
- belongs_to :user

## Ordersテーブル
|  Column       |  Type      |  Options                       |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| month         | integer    | null: false                    |
| day           | integer    | null: false                    |
| security_cord | integer    | null: false                    |
| postal_cord   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item