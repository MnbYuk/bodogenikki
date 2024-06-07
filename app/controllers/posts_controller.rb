class PostsController < ApplicationController
def index
    @posts = GamePost.all
  end

  def show
  end

  def new
    @post = GamePost.new
  end

  def edit
  end

  def create
    @post = GamePost.new(post_params)
    if @post.save
      redirect_to @post, notice: 'GamePost was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'GamePost was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'GamePost was successfully destroyed.'
  end
end
