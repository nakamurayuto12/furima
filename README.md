
# DB 設計

## users table

| Column             | Type                | Options          |
|--------------------|---------------------|------------------|
| name               | string              | null: false      |
| e-mail             | string              | null: false      |
| password           | string              | null: false      |
| birthday           | string              | null: false      |

### Association

* has_many :items
* belongs_to :comments

## items table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| title           | string     | null: false       |
| text            | text       | null: false       |
| address         | string     | null: false       |
| price           | string     | null: false       |
| category        | string     | null: false       |
| user            | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchased

 ## Purchased table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| item             | references | foreign_key: true |
| user             | references | foreign_key: true |
| credit card      | string     | unique: true      |
| shipping address | string     | null: false       |
| postal code      | string     | null: false       |
| TEL              | string     | null: false       |

### Association

- belongs_to :items
- belongs_to :user
