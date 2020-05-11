class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :pay]
  layout 'application2'

  require "payjp"
  
  def index
    @profile = Profile.find_by(user: current_user)
    @CreditCard = CreditCard.find_by(user: current_user)
    @User = User.find(current_user.id)
  end
  
  def pay
    @card = CreditCard.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
    @charge = Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
      )
    @item.update(buyer_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
