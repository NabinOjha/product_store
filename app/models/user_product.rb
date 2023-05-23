class UserProduct  < ApplicationRecord 
  belongs_to :user
  belongs_to :product

  validates :quantity, presence: true, numericality: {greater_than_or_equal_to: 1}

  enum status: [:ordered, :delivered, :cancelled]
end