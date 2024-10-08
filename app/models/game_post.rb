class GamePost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comment_posts, dependent: :destroy
  validates :post_title, presence: true
  validates :post_body, presence: true
   has_one_attached :post_image

  def self.search(query)
    where("post_title LIKE ? OR post_body LIKE ?", "%#{query}%", "%#{query}%")
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
