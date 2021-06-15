FactoryBot.define do
  factory :foundation do
    facility_name         {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    postal_code           {"123-4567"}
    location_id           { 3 }
    municipality          {"東京都"}
    address               {"1-1" }
    building_name         {"建物ハウス"}
    phone_number          {"0804034333"} 
  end
end
