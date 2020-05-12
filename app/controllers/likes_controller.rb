class LikesController < ApplicationController
  before_action :set_item, only: [:create, :destroy]
  def index
  end
  
  def create
    current_user.likes.create(item_id: params[:item_id])
    redirect_to item_path(@item)
  end

  def destroy
    like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    like.destroy
    redirect_to item_path(@item)
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
