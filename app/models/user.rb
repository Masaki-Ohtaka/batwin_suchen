class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { man: 0, woman: 1}

  with_options presence: true do
    validates :nickname
    validates :profile
    validates :birthday
    validates :gender
    validates :first_name
    validates :last_name
    validates :first_kana
    validates :last_kana
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :location_id, numericality: { other_than:0} 
    validates :municipality
    validates :address
    validates :phone_number,format: { with: /\A\d{10,11}\z/, message: 'is invalid. Include half-width numbers' }
  end
  
  has_many :prototypes
  has_many :comments
end
