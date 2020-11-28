
# DB 設計

## users table

| Column             | Type                | Options          |
|--------------------|---------------------|------------------|
| name               | string              | null: false      |
| e-mail             | string              | null: false      |
| password           | string              | null:false       |

### Association

* has_many :items
* has_many :comments

## items table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| title           | string     | null: false       |
| text            | text       | null: false       |
| address         | text       | null: false       |
| price           | text       | null: false       |
| user            | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
 
 ## buys table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| item        | references | foreign_key: true |

### Association

- belongs_to :items
- has_one : shipping address

 ## shipping address table

| Column           | Type       | Options           |
|------------------|------------|-------------------|
| TEL              | string     | null: false       |
| shipping_address | string     | foreign_key: true |

### Association

- belongs_to :buy
