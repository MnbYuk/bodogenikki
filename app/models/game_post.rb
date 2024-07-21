class GamePost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :post_title, presence: true
  validates :post_body, presence: true
   has_one_attached :post_image
   

end
