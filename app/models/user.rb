class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :game_posts
  has_one_attached :profile_image
  
  validates :name, presence: true
  validates :introduction, length: { maximum: 500 }
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/profile_no_img.png')
      profile_image.attach(io: File.open(file_path), filename: 'profile_no_img.png', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
