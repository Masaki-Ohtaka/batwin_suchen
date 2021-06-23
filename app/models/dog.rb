class Dog < ApplicationRecord
  belongs_to :job_change_dog
  attachment :image
end
