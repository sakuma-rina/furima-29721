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
| ken_id   | integer | null: false                    |
| machi    | string  | null: false                    |
| banchi   | string  | null: false                    |
| tatemono | string  |                                |
| denwa    | string  | null: false                    |
| buy_id   | integer | null: false, foreign_key: ture |

belongs_to : buys

