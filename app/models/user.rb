class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image
  validates :name, length: { in: 2..30 }
end
