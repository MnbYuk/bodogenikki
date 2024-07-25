class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :game_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :profile_image, dependent: :destroy

  validates :name, presence: true
  validates :introduction, length: { maximum: 500 }
  # validates :is_valid, inclusion: { in: [true, false] }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/profile_no_img.png')
      profile_image.attach(io: File.open(file_path), filename: 'profile_no_img.png', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
