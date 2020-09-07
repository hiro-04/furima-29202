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

### テーブル設計		
		
## users テーブル
		
| Column                | Type   | Options      |
| -------               | -----  | ------------ |
| first_name            | string | null: false  |
| family_name           | string | null: false  |
| first_name(フリガナ)   | string | null: false  |
| family_name(フリガナ)  | string | null: false  |
| email                 | string | null: false  |
| password              | string | null: false  |
| birthday              | string | null: false  |
		
### Association
		
-has_many :items
-has_many :comments
-has_one :buyer
		
## itemsテーブル
		
| Column       | Type   | Options      |
| -------      | -----  | ------------ |
| title        | string | null: false  |
| image        | string | null: false  |
| detail       | string | null: false  |
| category     | string | null: false  |
| status       | string | null: false  |
| burden       | string | null: false  |
| area         | string | null: false  |
| days         | string | null: false  |
| price        | string | null: false  |
| tax          | string | null: false  |
| benefit      | string | null: false  |

### Association
		
-belongs_to:user
-has_many:comments
-has_one:buyer
		
### commentsテーブル
		
| Column      | Type   | Options      |
| -------     | -----  | ------------ |
| text        | string | null: false  |
| user_id     | string | null: false  |
| item_id     | string | null: false  |		
		
### Association
-belongs_to:user
-belongs_to:item
		
### buyerテーブル
		
| Column        | Type   | Options      |
| -------       | -----  | ------------ |
| user_id   | string | null: false  |
| item_id          | string | null: false  |
		
### Association
-belongs_to:user
-belongs_to:item
-has_one:order

### orderテーブル

| Column            | Type   | Options      |
| -------           | -----  | ------------ |
| prefectures       | string | null: false  |
| city              | string | null: false  |
| buyer_id          | string | null: false  |

-belongs_to:user
-belongs_to:item
-belongs_to:buyer