
# DB 設計

## users table

| Column             | Type                | Options          |
|--------------------|---------------------|------------------|
| e-mail             | string              | null: false      |
| password           | string              | null: false      |
| birthday           | date                | null: false      |
| surname            | string              | null: false      |
| name               | string              | null: false      |
| surname furigana   | string              | null: false      |
| name furigana      | string              | null: false      |

### Association

* has_many :items
* has_many :purchase management

## items table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| title            | string     | null: false       |
| text             | text       | null: false       |
| address          | string     | null: false       |
| price            | string     | null: false       |
| category         | string     | null: false       |
| user             | references | foreign_key: true |
| status           | string     | null: false       |
| shipping charges | string     | null: false       |
| shipment source  | string     | null: false       |
| day to ship      | string     | null: false       |


### Association

- belongs_to :user
- has_one :purchased

 ## Purchased table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| item             | references | foreign_key: true |
| credit card      | string     | unique: true      |
| shipping address | string     | null: false       |
| postal code      | string     | null: false       |
| TEL              | string     | null: false       |

### Association

- belongs_to :items
- belongs_to :purchase management

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| item             | references | foreign_key: true |
| user             | references | foreign_key: true |
| Purchase date    | date       | null: false       |

### Association

belongs_to :Purchased
belongs_to :users
k


