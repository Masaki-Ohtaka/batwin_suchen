FactoryBot.define do
  factory :job_change_dog do
    dogs_images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/A-test4.jpg'), 'image/jpeg') }
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
