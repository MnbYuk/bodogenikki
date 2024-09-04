class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :game_post
  
  
  validates :user_id, uniqueness: {scope: :game_post_id}
  

end
