class CommentsController < ApplicationController

  def create
    game_post = GamePost.find(params[:game_post_id])
    comment = current_user.comments.new(comment_params)
    comment.game_post_id = game_post.id
    comment.save
    redirect_to game_post_path(game_post)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
