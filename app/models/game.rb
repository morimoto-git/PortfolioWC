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

  enum player: ["~2人", "~4人", "~10人", "10人以上"]
  enum playing_time: ["~5分", "~10分", "~20分", "20分以上"]
  enum level: ["~3歳", "~7歳", "~12歳", "12歳以上"]
end
