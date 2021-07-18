FactoryBot.define do
  factory :comment do
    text  {"コメント"}

    association :user #アソシエーション
    association :foundation
    association :job_change_dog
  end
end
