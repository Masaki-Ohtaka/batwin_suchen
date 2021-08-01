# アプリケーション名
「Batwin_suchen」
<img width="1440" alt="トップページ" src="https://user-images.githubusercontent.com/78934225/127768875-bb8dd1b8-1a46-4bc9-a86e-979896dc22a6.png">

# アプリケーション概要
施設者及び補助犬協会向けのジョブチェンジ犬用マッチングサイト。

## コンセプト
補助犬種はラブラドル・レドリバーがほとんどですが、ゴールデンレトリバーやプードルもいます。ファミリー層に人気な犬種の譲渡先を手軽に見つけ、補助犬の事を周りに広めて欲しい

# 機能一覧
- ユーザー登録、ログイン機能(Devise)

<img width="1440" alt="ユーザー登録" src="https://user-images.githubusercontent.com/78934225/127783269-3feb9cd8-fd26-4dc7-b669-acf9b9139fd1.png">
<img width="1440" alt="ユーザーログイン" src="https://user-images.githubusercontent.com/78934225/127783927-33b1731d-17f9-4da6-b024-f5c0e3d8f8d6.png">

- 施設者登録、ログイン機能(Devise)

<img width="1440" alt="施設者登録" src="https://user-images.githubusercontent.com/78934225/127782943-ad42d9e6-49b7-4b00-aedf-c9c45cb1fa81.png">
<img width="1440" alt="施設者ログイン" src="https://user-images.githubusercontent.com/78934225/127783907-b3c3a83a-f566-492b-a68d-3da23a5483ec.png">


- ジョブチェンジ登録機能
  - 複数画像投稿(Refile)

<img width="1440" alt="犬の登録" src="https://user-images.githubusercontent.com/78934225/127783593-652028fa-d5a2-43de-bdea-aac9a3977584.png">

- コメント機能(Action Cable)

<img width="1440" alt="チャット機能" src="https://user-images.githubusercontent.com/78934225/127784045-c1b81b38-e39e-48d7-b08b-15ae79db9a70.png">

- スライドショー機能(Slick)
https://gyazo.com/8ca291678c38cf13a6890edf00e625ae
- 支援機能
  - クレジットカード決算(Payjp)

<img width="1440" alt="支援機能" src="https://user-images.githubusercontent.com/78934225/127784100-bfef73d8-a4cc-4671-8a64-5480aff8763b.png">

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