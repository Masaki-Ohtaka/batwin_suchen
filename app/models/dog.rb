class Dog < ApplicationRecord
  #修正候補
  belongs_to :job_change_dog
  attachment :image
end
