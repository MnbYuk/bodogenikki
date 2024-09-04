class Public::FavoritesController < ApplicationController
  
  def create
    game_post = GamePost.find(params[:game_post_id])
    favorite = current_user.favorites.new(game_post_id: game_post.id)
    favorite.save
    redirect_to game_post_path(game_post)
  end
  
  def destroy
    game_post = GamePost.find(params[:game_post_id])
    favorite = current_user.favorites.find_by(game_post_id: game_post.id)
    favorite.destroy
    redirect_to game_post_path(game_post)
  end
  
end
