class LikesController < ApplicationController
  before_action :set_item, only: [:create, :destroy]
  def create
    @item(user_id) = current_user.id
    @like = current_user.likes.create(params[:item_id])
    redirect_to items_path(@item)
  end

  def destory
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destory
    redirect_to items_path(@item)
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
