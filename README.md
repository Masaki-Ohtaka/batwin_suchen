# アプリケーション名
「Batwin_suchen」
<img width="1440" alt="トップページ" src="https://user-images.githubusercontent.com/78934225/127768875-bb8dd1b8-1a46-4bc9-a86e-979896dc22a6.png">

# アプリケーション概要
施設者及び補助犬協会向けのジョブチェンジ犬用マッチングサイト。

## コンセプト
補助犬種はラブラドル・レドリバーがほとんどですが、ゴールデンレトリバーやプードルもいます。ファミリー層に人気な犬種の譲渡先を手軽に見つけ、補助犬の事を周りに広めて欲しい

# 機能一覧
- ユーザー登録、ログイン機能(Devise)
- 施設者登録、ログイン機能(Devise)
- ジョブチェンジ登録機能
  - 複数画像投稿(Refile)
- コメント機能(Action Cable)
- スライドショー機能(Slick)
- 支援機能
  - クレジットカード決算(Payjp)

# 実装予定の機能又は修正
- マイページ機能(ユーザー、施設者)
  - お気に入り機能
- レスポンシブデザイン（一部崩れるところがあります）
- AWS〜S3、EC2(デプロイ未完成なので最優先)

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
| -------------- | ----------- | ----------------------------- |
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
| -------------- | ---------- | ------------------ |
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
| ---------------- | ----------- | ------------------------------ |
| user_id          | references  | null: false, foreign_key: true |
| job_change_dog_id| references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :job_change_dog