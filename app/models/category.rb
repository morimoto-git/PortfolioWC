class Category < ApplicationRecord
  validates :name, length: { in: 2..30 }
end
