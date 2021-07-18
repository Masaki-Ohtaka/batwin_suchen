FactoryBot.define do
  factory :job_change_dog do
    name        {'テスト'}
    age         {10}
    breed_id    {2}
    far_color   {'赤色'}
    gender_id   {2}
    personality {'明るい'}
    surgery_id  {2}
    vaccine_id  {2}
    publication {20211213}
    word        {'テストです'}
    price       {300}

    association :foundation
  end
end
