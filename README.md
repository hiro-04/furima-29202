
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
-has_many :buyers
		
## itemsテーブル
		
| Column       | Type       | Options                           |
| -------      | -----      | ------------                      |
| title        | string     | null: false                       |
| content      | text       | null: false                       |
| category     | integer    | null: false                       |
| status       | integer    | null: false                       |
| burden       | integer    | null: false                       |
| area         | integer    | null: false                       |
| days         | integer    | null: false                       |
| price        | integer    | null: false                       |
| user         | references | null: false, foreign_key: true    |


### Association
		
-belongs_to:user
-has_one:order
	
		
### orderテーブル
		
| Column           | Type        | Options                         |
| -------          | -----       | ------------                    |
| user             | references  | null: false  foreign_key: true  |
| item             | references  | null: false  foreign_key: true  |
		
### Association
-belongs_to:user
-belongs_to:item
-has_one:address

### Addressテーブル

| Column                    | Type             | Options                          |
| -------                   | -----            | ------------                     |
| prefectures               | integer          | null: false                      |
| city                      | string           | null: false                      |
| house_number              | string           | null: false                      |
| building                  | string           |                    |
| telephone                 | string           | null: false                      |
| postal_code               | string           | null: false                      |
| order                     | references       | null: false, foreign_key: true   |

-belongs_to:order