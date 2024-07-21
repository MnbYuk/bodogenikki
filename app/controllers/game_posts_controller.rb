class GamePostsController < ApplicationController
  def index
    @game_posts = GamePost.all
  end

  def show
    @game_post = GamePost.find(params[:id])
    @comment = Comment.new
  end

  def new
    @game_post = GamePost.new
  end

  def edit
    game_post = GamePost.find(params[:id])
    unless game_post.user.id == current_user.id
      redirect_to game_post_path
    end
    @game_post = GamePost.find(params[:id])
    
  end

  def create
    @game_post = GamePost.new(game_post_params)
    @game_post.user_id = current_user.id
    if @game_post.save
      redirect_to game_post_path(@game_post.id)
    else
      render :new
    end
  end

  def update
    @game_post =GamePost.find(params[:id])
    @game_post.update(game_post_params)
    if @game_post.save
      flash[:notice_game_post_update] = "更新しました"
      redirect_to game_post_path(@game_post.id)
    else
      render :edit
    end
  end

  def destroy
    game_post = GamePost.find(params[:id])
    game_post.destroy
    redirect_to root_path
  end



  private

  def game_post_params
    params.require(:game_post).permit(:post_title, :post_body, :post_image, :shop_name, :shop_address)
  end

end