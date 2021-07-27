# テーブル設計

## users テーブル

| Column           | Type          | Options                   |
| ---------------- | ------------- | ------------------------- |
| nickname         | string        | null: false               |
| email            | string        | null: false, unique: true |
| password         | string        | null: false               |
| profile          | string        | null: false               |
| birthday         | date          | null: false               |
| gender_id        | integer       | null: false               |
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

- has_one :supports
- has_many :comments

## foundation テーブル

| Column           | Type          | Options                   |
| ---------------- | ------------- | ------------------------- |
| facility_name    | string        | null: false               |
| email            | string        | null: false, unique: true |
| password         | string        | null: false               |
| postal_code      | string        | null: false               |
| location_id      | integer       | null: false               |
| municipality     | string        | null: false               |
| address          | string        | null: false               |
| building_name    | string        |                           |
| phone_number     | string        | null: false               |

### Association
- has_many :job_change_dogs
- has_many :comments

## job_change_dogs テーブル

| Column         | Type        | Options                       |
| ----------- | ----------- | ----------------------------- |
| name           | string      | null: false                   |
| age            | string      | null: false                   |
| breed_id       | integer     | null: false                   |
| far_color      | string      | null: false                   |
| gender_id      | integer     | null: false                   |
| personality    | string      | null: false                   |
| surgery_id     | integer     | null: false                   |
| vaccine_id     | integer     | null: false                   |
| publication    | date        | null: false                   |
| word           | text        | null: false                   |
| price          | integer     | null: false                   |
| foundation_id  | references  | null: false, foreign_key:true |

### Association

- belongs_to :foundation
- has_many :comments
- has_many :dogs
- has_one  :support


## dogs テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| image_id          | string      | null: false                    |
| job_change_dog_id | references  | null: false, foreign_key: true |

### Association

- belongs_to :job_change_dog

## comments テーブル

| Column         | Type       |  Options           |
| ---------------| ---------- | ------------------ |
| text           | string     | null: false,       |
| user           | references | foreign_key: true  |
| foundation     | references | foreign_key: true  |
| job_change_dog | references | foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :foundation
- belongs_to :job_change_dog

## supports テーブル

| Column           | Type        | Options                        |
| --------------   | ----------  | ------------------------------ |
| user_id          | references  | null: false, foreign_key: true |
| job_change_dog_id| references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :job_change_dog