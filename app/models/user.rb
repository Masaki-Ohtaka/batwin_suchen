class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..128

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :location
  belongs_to :gender

  has_many :comments,dependent: :destroy
  has_one :support, dependent: :destroy
  # enum gender: { man: 0, woman: 1}
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数混合入力です', on: :create
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数混合入力です', allow_blank: true, on: :update
  with_options presence: true do
    validates :nickname
    validates :profile
    validates :birthday
    validates :gender_id, inclusion: {in:[1,2], message: 'は不正値です。男性か女性を選んで下さい'}
    validates :first_name
    validates :last_name
    validates :first_kana
    validates :last_kana
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'が認識できません.半角英数字とハイフン（-）を含めてください' }
    # validates :location_id, numericality: { other_than:0,message: "を選択してください"}
    # validates :location_id, inclusion: { in:[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47],message: "を選択してください"}
    validates :location_id, inclusion: { in: Location.where.not(name: "---").pluck(:id),message: "を選択してください"}
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
