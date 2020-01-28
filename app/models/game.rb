class Game < ApplicationRecord
  belongs_to :user
  belongs_to :category
  attachment :main_image
  has_many :game_rules, dependent: :destroy
  accepts_nested_attributes_for :game_rules, allow_destroy: true

  validates :title, length: { in: 1..40 }
  validates :category_id, presence: true
  validates :content, length: { in: 1..200 }

  enum player: { "1~2人": 1, "3~4人": 2, "5~7人": 3, "8~9人": 4, "10人以上": 5 }
  enum playing_time: { "1~2分": 1, "3~5分": 2, "6~10分": 3, "10~14分": 4, "15分以上": 5 }
  enum level: { "2歳以上": 1, "6歳以上": 2, "9歳以上": 3, "12歳以上": 4, "15歳以上": 5 }

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end

  has_many :notifications, dependent: :destroy

  def create_notification_favorite!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and game_id = ? and action = ?", current_user.id, user_id, id, "favorite"])
    if temp.blank?
      notification = current_user.active_notifications.new(
        game_id: id,
        visited_id: user_id,
        action: "favorite"
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(game_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id["user_id"])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      game_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: "comment"
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end
