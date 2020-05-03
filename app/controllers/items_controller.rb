class ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

end
