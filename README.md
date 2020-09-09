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
| first_name_kana       | string | null: false  |
| family_name_kana      | string | null: false  |
| email                 | string | null: false  |
| password              | string | null: false  |
| birthday              | date   | null: false  |
		
### Association
		
-has_many :items
-has_many :comments
-has_many :buyers
		
## itemsテーブル
		
| Column       | Type       | Options                           |
| -------      | -----      | ------------                      |
| title        | string     | null: false                       |
| detail       | text       | null: false                       |
| category     | integer    | null: false                       |
| status       | integer    | null: false                       |
| burden       | integer    | null: false                       |
| area         | integer    | null: false                       |
| days         | integer    | null: false                       |
| price        | integer    | null: false                       |
| user         | references | null: false, foreign_key: true    |


### Association
		
-belongs_to:user
-has_many:comments
-has_one:buyer
		
### commentsテーブル
		
| Column      | Type       | Options                         |
| -------     | -----      | ------------                    |
| text        | string     | null: false                     |
| user        | references | null: false, foreign_key: true  |
| item        | references | null: false, foreign_key: true  |  
		
### Association
-belongs_to:user
-belongs_to:item
		
### buyerテーブル
		
| Column           | Type        | Options                         |
| -------          | -----       | ------------                    |
| user             | references  | null: false  foreign_key: true  |
| item             | references  | null: false  foreign_key: true  |
		
### Association
-belongs_to:user
-belongs_to:item
-has_one:order

### orderテーブル

| Column                    | Type             | Options                          |
| -------                   | -----            | ------------                     |
| prefectures               | integer          | null: false                      |
| city                      | integer          | null: false                      |
| house_number              | integer          | null: false                      |
| building                  | integer          |                    |
| telephone                 | integer          | null: false                      |
| postal_code               | integer          | null: false                      |
| buyer                     | references       | null: false, foreign_key: true   |

-belongs_to:buyer