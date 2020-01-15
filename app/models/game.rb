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

  has_many :notifications, dependent: :destroy

  def create_notification_favorite!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and game_id = ? and action = ?", current_user.id, user_id, id, "favorite"])
    #いいねされていない時のみ通知
    if temp.blank?
      notification = current_user.active_notifications.new(
        game_id: id,
        visited_id: user_id,
        action: "favorite"
      )
      #自分に対するいいねは通知済み設定
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


  enum player: ["~2人", "~4人", "~10人", "10人以上"]
  enum playing_time: ["~5分", "~10分", "~20分", "20分以上"]
  enum level: ["~3歳", "~7歳", "~12歳", "12歳以上"]
end
