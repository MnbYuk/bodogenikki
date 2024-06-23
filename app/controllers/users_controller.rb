class UsersController < ApplicationController
  def mypage
    @user = User.find(params[:id])
    @game_posts = @user.game_posts
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])

  end

  def show
    @users = User.all
  end


  def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to root_path
    end
    if @user.update(user_params)
      flash[:notice_user_update] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
end
private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
