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
		
| Column   | Type   | Options      |
| -------  | -----  | ------------ |
| nickname | string | null: false  |
| email    | string | null: false  |
| password | string | null: false  |
		
### Association
		
-has_many :items
-has_many :comments
-has_one :buyer
		
## itemsテーブル
		
| Column   | Type   | Options      |
| -------  | -----  | ------------ |
| name     | string | null: false  |
| image    | string | null: false  |
| text     | string | null: false  |
		
### Association
		
-belongs_to:user
-has_many:comments
-has_one:buyer
		
### commentsテーブル
		
| Column   | Type   | Options      |
| -------  | -----  | ------------ |
| text     | string | null: false  |
		
		
### Association
-belongs_to:user
-belongs_to:item
		
### buyerテーブル
		
| Column   | Type   | Options      |
| -------  | -----  | ------------ |
| adress   | string | null: false  |
		
### Association
-belongs_to:user
-belongs_to:item
