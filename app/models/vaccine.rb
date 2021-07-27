class Vaccine < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' }, 
    { id: 1, name: '未' },
    { id: 2, name: 'コアワクチン済' },
    { id: 3, name: 'ノンコアワクチン済' },
    { id: 4, name: 'コアワクチン・ノンコアワクチン済' }
  ]
  include ActiveHash::Associations
  has_many :job_change_dogs
end