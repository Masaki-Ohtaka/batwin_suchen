class JobChangeDog < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :vaccine
  belongs_to :surgery
  belongs_to :breed

  belongs_to :foundation
  has_many :comments, dependent: :destroy
  has_many :dogs, dependent: :destroy
  has_one  :support
  accepts_attachments_for :dogs, attachment: :image

  with_options presence: true do #プルダウン表記の_idについてリファクタリング出来るのでは？
    validates :name
    validates :age,format: { with: /\A\d{1,2}\z/, message: 'が認識できません. 半角数字で入力してください' }
    validates :breed_id, numericality: { other_than:0,message: "を選択してください"}
    validates :far_color
    validates :gender_id
    validates :personality
    validates :surgery_id, numericality: { other_than:0,message: "を選択してください"}
    validates :vaccine_id, numericality: { other_than:0,message: "を選択してください"}
    validates :publication
    validates :word
    validates :price
  end
  validate :image_length

  private
  def image_length
    if dogs_images.length > 4
      errors.add(:image_id, 'は4枚以内にしてください')
    end
  end

end
