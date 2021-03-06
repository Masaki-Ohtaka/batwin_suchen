# アプリケーション名
「Batwin_suchen」
<img width="1440" alt="トップページ" src="https://user-images.githubusercontent.com/78934225/127768875-bb8dd1b8-1a46-4bc9-a86e-979896dc22a6.png">

# アプリケーション概要
施設者及び補助犬協会向けのジョブチェンジ犬用マッチングサイト。

## コンセプト
施設者とユーザを手軽に繋ぎ、ジョブチェンジ犬を支援という形で譲渡できる。補助犬についての知識を安く犬を飼いたい方から広めて欲しい。

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

# テスト用アカウント
ユーザー
  メールアドレス:a@test
  パスワード:1234aa
施設者
  メールアドレス：c@test
  パスワード:1234cc
# 実装予定の機能又は修正
- 非ログイン機能実装
- レスポンシブデザイン（一部崩れるところがあります）
- デプロイをherokuからEC2に
- 現在クレジットカード決済できない為、要確認
