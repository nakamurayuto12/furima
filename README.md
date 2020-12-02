
# DB 設計

## users table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| email              | string              | unique: true, null: false     |
| encrypted_password | string              | null: false                   |
| birthday           | date                | null: false                   |
| surname            | string              | null: false                   |
| name               | string              | null: false                   |
| surname_furigana   | string              | null: false                   |
| name_furigana      | string              | null: false                   |
| nickname           | string              | null: false                   |

### Association

* has_many :items
* has_many :purchase_managements
* belongs_to :Purchased


## items table

| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| title               | string     | null: false       |
| text                | text       | null: false       |
| price               | integer    | null: false       |
| category_id         | integer    | null: false       |
| user                | references | foreign_key: true |
| status_id           | integer    | null: false       |
| shipping_charges_id | integer    | null: false       |
| shipment_source_id  | integer    | null: false       |
| day_to_ship_id      | integer    | null: false       |


### Association

- belongs_to :user
- has_one :purchase_management

 ## Purchased table

| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| shipping_address    | string     | null: false       |
| postal_code         | string     | null: false       |
| phone_number        | string     | null: false       |
| municipalities      | string     | null: false       |
| address.id          | string     | null: false       |
| purchase_management | references | foreign_key: true |
| building            | string     |                   |

### Association

- belongs_to :purchase_management
- belongs_to :user


## purchase_management table

| Column              | Type       | Options           |
|---------------------|------------|-------------------|
| item                | references | foreign_key: true |
| user                | references | foreign_key: true |

### Association

has_one :purchased
belongs_to :user
belongs_to :item