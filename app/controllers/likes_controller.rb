class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(item_id: params[:item_id])
  end

  def destory
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
  end