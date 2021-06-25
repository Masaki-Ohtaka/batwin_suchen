class Gender < ActiveHash::Base
  self.data =[none: 0, woman: 1, man: 2 ]

  include ActiveHash::Associations
  has_many :users
  has_many :job_change_dogs
end
