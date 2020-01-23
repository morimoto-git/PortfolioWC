class GameRule < ApplicationRecord
  belongs_to :game
  attachment :image

  validates :text, length: { in: 1..200 }
end
