class JobChangeDog < ApplicationRecord
  belongs_to :foundation
  # has_one_attached :image
  has_many :dogs, dependent: :destroy
  accepts_attachments_for :dogs, attachment: :image
end
