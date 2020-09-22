# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

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

