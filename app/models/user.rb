class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :password_confirmation
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birth_day
  end
  
  has_many :comments, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :likes
  has_many :user_rates
  has_one :profile, dependent: :destroy
  has_one :credit_card, dependent: :destroy

end
