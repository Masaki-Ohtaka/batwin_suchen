class Support < ApplicationRecord
  belongs_to :user
  belongs_to :job_change_dog
  # attr_accessor :user_id,:job_change_dog_id,:token
  with_options presence: true do
    validates :user_id
    validates :job_change_dog_id
    # validates :token
  end

end
