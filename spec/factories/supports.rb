FactoryBot.define do
  factory :support do
    token         { 'aiueokakikukeko'} 
    
    association :user
    association :job_change_dog 
  end
end
