class Api::ItemsController < ApplicationController
  def update
    @item = Item.find(params[:item_id])
    @item.update(buyer_id: params[:buyer_id])
  end
  # private
  # def item_params
  #   params.permit(:item_id).merge(buyer_id: current_user.id)
  # end
end
