class Product < ApplicationRecord 
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0.01 } 
end