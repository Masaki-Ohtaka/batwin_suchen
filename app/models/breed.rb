class Breed < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' }, 
    { id: 1, name: 'ゴールデン・レトリバー' },
    { id: 2, name: 'ラブラドル・レトリバー' },
    { id: 3, name: 'プードル' },
    { id: 4, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :job_change_dogs
end