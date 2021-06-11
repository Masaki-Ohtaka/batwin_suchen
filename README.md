       # テーブル設計

## users テーブル

| Column           | Type          | Options                   |
| ---------------- | ------------- | ------------------------- |
| nickname         | string        | null: false               |
| email            | string        | null: false, unique: true |
| password         | string        | null: false               |
| profile          | string        | null: false               |
| birthday         | date          | null: false               |
| gender           | integer       | null: false               |
| first_name       | string        | null: false               |
| last_name        | string        | null: false               |
| first_kana       | string        | null: false               |
| last_kana        | string        | null: false               |
| postal_code      | string        | null: false               |
| location_id      | integer       | null: false               |
| municipality     | string        | null: false               |
| address          | string        | null: false               |
| building_name    | string        |                           |
| phone_number     | string        | null: false               |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column      | Type        | Options                       |
| --------    | ------      | -----------                   |
| title       | string      | null: false                   |
| catch_copy  | string      | null: false                   |
| concept     | text        | null: false                   |
| image       |             |                               |
| user        | references  | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル

| Column      | Type       |  Options                       |
| -------     | ---------- | ------------------------------ |
| text        | string     | null: false,                   |
| user        | references | null: false, foreign_key: true |
| prototype   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype