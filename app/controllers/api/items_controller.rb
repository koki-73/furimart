class Api::ItemsController < ApplicationController
  def update
    @item = Item.find(params[:item_id])
    @item.update(buyer_id: params[:buyer_id])
  end
end
