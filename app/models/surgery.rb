class Surgery < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '未' },
    { id: 2, name: '済' }
  ]
  include ActiveHash::Associations
  has_many :job_change_dogs
end