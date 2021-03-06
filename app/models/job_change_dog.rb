class JobChangeDog < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :vaccine
  belongs_to :surgery
  belongs_to :breed

  belongs_to :foundation
  has_many :comments, dependent: :destroy


  # has_many :dogs, dependent: :destroy
  #修正候補2点
  has_many_attached :images 
  # accepts_attachments_for :dogs, attachment: :image

  has_one  :support
  # accepts_attachments_for :dogs, attachment: :image

  with_options presence: true do #プルダウン表記の_idについてリファクタリング出来るのでは？
    # validates :dogs_images
    #修正候補
    validates :images
    
    validates :name
    #in: 0..29の形形だとActiveModel::RangeError発生
    validates :age, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 29},format: { with: /\A[0-9]+\z/, message: 'が認識できません. 半角数字で入力してください' }
    # validates :breed_id, numericality: { other_than:0,message: "を選択してください"}
    validates :breed_id, inclusion: {in: Breed.where.not(name: "---").pluck(:id), message: "を選択してください"}
    validates :far_color
    validates :gender_id, inclusion: {in: [1,2], message: 'は不正値です。男性か女性を選んで下さい'}
    validates :personality
    # validates :surgery_id, numericality: { other_than:0,message: "を選択してください"}
    validates :surgery_id, inclusion: {in: Surgery.where.not(name: "---").pluck(:id), message: "を選択してください"}
    # validates :vaccine_id, numericality: { other_than:0,message: "を選択してください"}
    validates :vaccine_id, inclusion: {in: Vaccine.where.not(name: "---").pluck(:id), message: "を選択してください"}
    validates :publication
    validates :word
    validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
    # 画像投稿制限
    # validate :image_length

  # private
  # def image_length
  #   # if dogs_images.length > 4
  #   #   errors.add(:image_id, 'は4枚以内にしてください')

  #   #修正候補2点
  #   if dogs_images.length > 4
  #     errors.add(:image_id, 'は4枚以内にしてください')


  #   end
  # end

end
