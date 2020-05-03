class MyPagesController < ApplicationController
  def index
    @card = CreditCard.where(user_id: current_user.id).first
  end
end
