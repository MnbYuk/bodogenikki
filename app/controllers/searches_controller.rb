class SearchesController < ApplicationController
  def index
    @items = if params[:query].present?
               Item.where("name LIKE ?", "%#{params[:query]}%")
             else
               Item.none
             end
  end
end
