
# DB 設計

## users table

| Column             | Type                | Options          |
|--------------------|---------------------|------------------|
| email              | string              | null: false      |
| encrypted_password | string              | null: false      |
| birthday           | date                | null: false      |
| surname            | string              | null: false      |
| name               | string              | null: false      |
| surname furigana   | string              | null: false      |
| name furigana      | string              | null: false      |
| nickname           | string              | null: false      |


### Association

* has_many :items
* has_many :purchase managements

## items table

| Column             | Type       | Options           |
|--------------------|------------|-------------------|
| title_id           | string     | null: false       |
| text               | text       | null: false       |
| price_id           | integer    | null: false       |
| category_id        | string     | null: false       |
| user               | references | foreign_key: true |
| status             | string     | null: false       |
| shipping charges   | string     | null: false       |
| shipment source_id | string     | null: false       |
| day to ship      | string     | null: false       |


### Association

- belongs_to :user
- has_one :purchased table

 ## Purchased table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| shipping address | string     | null: false       |
| postal code      | string     | null: false       |
| phone_number     | string     | null: false       |
| municipalities   | string     | null: false       |
| address          | string     | null: false       |

### Association

- belongs_to :item
- belongs_to :purchase_management table

| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| item                | references | foreign_key: true |
| user                | references | foreign_key: true |

### Association

belongs_to :Purchased table
belongs_to :user


