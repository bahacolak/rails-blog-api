class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[A-Z])(?=.*\d)(?=.*[!@#$&*()\-_=+\[\]{};:'",.<>?\\|`~^]).{8,}\z/, message: "must include at least one uppercase letter, one digit, and one special character" }, if: :password_required?
end