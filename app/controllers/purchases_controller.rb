class PurchasesController < ApplicationController
  layout 'application2'
  
  def new
    @item = Item.find(params[:item_id])
  end

  def update
    @item = Item.find(params[:buyer_id])
    @item = update(buyer_id: current_user.id)
  end
end
