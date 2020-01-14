class Game < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :game_rules, dependent: :destroy
  accepts_nested_attributes_for :game_rules, allow_destroy: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end
