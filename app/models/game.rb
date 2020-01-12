class Game < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :game_rules, dependent: :destroy
  accepts_nested_attributes_for :game_rules, allow_destroy: true
end
