class Gender < ActiveHash::Base
  self.data =[ 
    { id: 1, name: '♂' },
    { id: 2, name: '♀' },
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :job_change_dogs
end
