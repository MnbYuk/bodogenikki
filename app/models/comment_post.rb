class CommentPost < ApplicationRecord
  belongs_to :user
  belongs_to :game_post

  
    validates :comment, length: { minimum: 1, maximum: 500 }
end
