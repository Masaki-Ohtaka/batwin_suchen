class Foundation < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_change_dogs,dependent: :destroy
  has_many :comments,dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数混合入力です', on: :create
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数混合入力です', allow_blank: true, on: :update
  with_options presence: true do
    validates :facility_name
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
