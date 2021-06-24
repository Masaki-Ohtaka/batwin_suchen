class JobChangeDog < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :vaccine
  belongs_to :surgery
  belongs_to :breed

  belongs_to :foundation
  has_many :dogs, dependent: :destroy
  accepts_attachments_for :dogs, attachment: :image

  with_options presence: true do #プルダウン表記の_idについてリファクタリング出来るのでは？
    validates :name
    validates :breed_id, numericality: { other_than:0,message: "を選択してください"}
    validates :far_color
    validates :gender_id
    validates :personality
    validates :surgery_id, numericality: { other_than:0,message: "を選択してください"}
    validates :vaccine_id, numericality: { other_than:0,message: "を選択してください"}
    validates :publication
  end

end
