class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game_post
end
