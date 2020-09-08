class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true       
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  #VALID_PASSWORD_REGAX = /[a-z\d]{6,}/i
  validates :password, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/ }  #{confirmation: true, format: { with: VALID_PASSWORD_REGAX }
  validates :password_confirmation, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
  # VALID_EMAIL_REGAX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true # format: { message: "emailが重複しています" }  #{confirmation: true, format: { with: VALID_EMAIL_REGAX }
  #validates :email_confirmation, presence: true
  validates :birthday, presence: true

end
