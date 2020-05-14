class MyPagesController < ApplicationController
  before_action :move_to_index, only: :index
  
  def index
    @user = current_user
    @rates = UserRate.where(user_id: @user.id).length
    @items = Item.where(user_id: @user.id).length
  end

  private

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
