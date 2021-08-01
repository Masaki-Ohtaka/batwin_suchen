# require 'refile/s3'

# #if !Rails.env.production? # 開発環境でS3へアップロードできているか確認する方法


#   aws = {
#     access_key_id: ENV['S3_ACCESS_KEY_ID'], #チェック アクセスキーID
#     secret_access_key: ENV['S3_SECRET_ACCESS_KEY'], #チェック シークレットアクセスキー
#     region: 'ap-northeast-1', # リージョン
#     bucket: 'furima34335',#修正候補①
#   }
#    Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
#    Refile.store = Refile::S3.new(prefix: 'store', **aws)