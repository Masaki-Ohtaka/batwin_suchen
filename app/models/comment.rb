class Comment < ApplicationRecord
  belongs_to :foundation,optional: true
  belongs_to :user,optional: true
  belongs_to :job_change_dog,optional: true
  

  validates :text, presence: true
end
