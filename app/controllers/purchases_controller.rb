class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :pay]
  layout 'application2'

  require "payjp"
  
  def index
    @profile = Profile.find_by(user: current_user)
    @card = CreditCard.find_by(user: current_user)
    @user = User.find(current_user.id)
    if @card
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    if @item.buyer_id.present? 
      render "purchases/sold_out"
    else 
      @card = CreditCard.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_SECRET_KEY]
      @charge = Payjp::Charge.create(
        amount: @item.price,
        customer: @card.customer_id,
        currency: 'jpy'
        )
      @item.update(buyer_id: current_user.id)
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
