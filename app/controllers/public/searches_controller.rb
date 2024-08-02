class Public::SearchesController < ApplicationController
  def index
    if params[:query].present?
      if params[:search_type] == "users"
        @results = User.search(params[:query])
      elsif params[:search_type] == "posts"
        @results = GamePost.search(params[:query])
      else
        @results = []
      end
    else
      @results = []
    end
  end
end
