class UsersController < ApplicationController
  def mypage
    @users = User.all
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path((current_user.id))
    end
    @user = User.find(params[:id])

  end

  def show 
    @user = User.find(params[:id])
    @post_games = @user.game_post
  end
end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice_user_update] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end