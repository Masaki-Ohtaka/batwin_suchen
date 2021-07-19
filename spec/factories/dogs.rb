FactoryBot.define do
  factory :dog do
    image_id {  Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/A-test4.jpg'), 'image/jpeg') }
    association :job_change_dog
  end
end
