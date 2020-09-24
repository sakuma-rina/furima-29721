# README


## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
|first_name      | string | null: false |
|last_name_kana  | string | null: false |
|first_name_kana | string | null: false |
|birthday        | date   | null: false |

has_many : items
has_many : buys

## items テーブル

| Column   　　  　| Type    | Options                        |
| ----------------| ------^ | ------------------------------ |
| user_id  　　　  | integer | null: false , foreign_key: ture|
| product_name    | string  | null: false                    |
| product_setumei | text    | null: false                    |
| category        | integer | null: false                    |
| jyoutai         | integer | null: false                    |
| haiso_futan     | integer | null: false                    |
| haiso_tiiki     | integer | null: false                    |
| haiso_kikan     | integer | null: false                    |
| kakaku          | integer | null: false                    |

bolongs_to : users
belongs_to : buys

## buys テーブル

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| user_id  | string | null: false , foreign_key: ture|
| item_id  | string | null: false , foreign_key: ture|

belongs_to : users
belongs_to : items
belongs_to : adress


## adress テーブル


| Column   | Type    | Options                        |
| -------- | ------  | ------------------------------ |
| post_code| string  | null: false                    |
| ken_id   | integer | null: false                   |
| machi    | string  | null: false                    |
| banchi   | string  | null: false                    |
| tatemono | string  |                                |
| denwa    | string  | null: false                     |
| buy_id   | integer | null: false, foreign_key: ture|

belongs_to : buys

<<<<<<< Updated upstream
* ...
# README


## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

has_many : items
has_many : buys

## items テーブル

| Column   　　  　| Type    | Options                        |
| ----------------| ------- | ------------------------------ |
| user_id  　　　  | integer | null: false , foreign_key: ture|
| product_name    | string  | null: false                    |
| description     | text    | null: false                    |
| category_id     | integer | null: false                    |
| condition_id    | integer | null: false                    |
| fee_id          | integer | null: false                    |
| address_id      | integer | null: false                    |
| days_id         | integer | null: false                    |
| price           | integer | null: false                    |

belongs_to : user
has_one : buy

## buys テーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| user_id  | integer | null: false , foreign_key: ture|
| item_id  | integer | null: false , foreign_key: ture|

belongs_to : user
belongs_to : item
has_one : adress


## addresses テーブル


| Column        | Type    | Options                        |
| ------------- | ------  | ------------------------------ |
| post_code     | string  | null: false                    |
| state_id      | integer | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  |                                |
| phone_number  | string  | null: false                    |
| buy_id        | integer | null: false, foreign_key: ture |

belongs_to : buy

=======
>>>>>>> Stashed changes
