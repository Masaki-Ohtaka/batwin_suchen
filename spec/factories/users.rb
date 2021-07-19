FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    first_name            {"嵐山"}
    last_name             { "太郎" }
    first_kana            {"アラシヤマ"}
    last_kana             {"タロウ"}
    gender_id             { 1 }
    profile               {"ニート"}
    birthday              {"19301010"}
    postal_code           {"123-4567"}
    location_id           { 3 }
    municipality          {"東京都"}
    address               {"1-1" }
    building_name         {"建物ハウス"}
    phone_number          {"0804034333"} 
  end
end