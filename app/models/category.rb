class Category < ApplicationRecord
  has_many :games, dependent: :destroy
  validates :name, length: { in: 2..30 }
end
