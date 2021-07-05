class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :location
  belongs_to :gender

  has_many :comments,dependent: :destroy
  has_one :support
  # enum gender: { man: 0, woman: 1}
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数混合入力です', on: :create
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数混合入力です', allow_blank: true, on: :update
  with_options presence: true do
    validates :nickname
    validates :profile
    validates :birthday
    validates :gender_id
    validates :first_name
    validates :last_name
    validates :first_kana
    validates :last_kana
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'が認識できません.半角英数字とハイフン（-）を含めてください' }
    validates :location_id, numericality: { other_than:0,message: "を選択してください"} 
    validates :municipality
    validates :address
    validates :phone_number,format: { with: /\A\d{10,11}\z/, message: 'が認識できません. 半角数字で入力してください' }
  end

  def update_without_current_password(params)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    update(params)
  end
end
