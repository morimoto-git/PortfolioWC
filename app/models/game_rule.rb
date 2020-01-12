class GameRule < ApplicationRecord
  belongs_to :game
  attachment :image
end
