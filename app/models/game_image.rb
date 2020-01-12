class GameImage < ApplicationRecord
  belongs_to :game
  attachment :image
end
