class Public::CommentPostsController < ApplicationController

  def create
    game_post = GamePost.find(params[:game_post_id])
    comment = current_user.comment_posts.new(comment_post_params)
    comment.game_post_id = game_post.id
    if comment.save
        redirect_to game_post_path(game_post)
    else
          @game_post = game_post
          @comment_post = comment
        render "public/game_posts/show"
    end
  end

  private

  def comment_post_params
    params.require(:comment_post).permit(:comment)
  end

end
