class GamePostsController < ApplicationController
  def index
    @posts = GamePost.all
  end

  def show
  end

  def new
    @game_post = GamePost.new
  end

  def edit
  end

  def create
    @game_post = GamePost.new(game_post_params)
    @game_post.user_id = current_user.id
    if @game_post.save
      redirect_to game_posts_path
    else
      render :new
    end
  end

  def update
    if @game_post.update(game_post_params)
      redirect_to game_posts_path
    else
      render :edit
    end
  end

  def destroy
    @game_post.destroy
    redirect_to posts_path
  end



  private

  def game_post_params
    params.require(:game_post).permit(:post_title, :post_body, :shop_name, :shop_address)
  end
  
end