class Category < ApplicationRecord
  validates :name, length: { in: 2..30 }
  has_many :games, dependent: :destroy
end
