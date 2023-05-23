class User < ApplicationRecord 
  validates :email, :password, :confirm_password, presence: true
  validates :email, uniqueness: true
  has_many :user_products, dependent: :destroy
  has_many :products, through: :user_products
end