require 'rails_helper'
describe CreditCard do
  describe '#create' do
    it "入力情報が正しければ登録できること" do
      user = build(:user)
      user_id = User.first.id
      card = build(:credit_card, user_id: user_id)
      expect(card).to be_valid
    end

    it "user_idがない場合は登録できないこと" do
      card = build(:credit_card, user_id: nil)
      card.valid?
      expect(card.errors[:user]).to include("を入力してください")
    end

    it "customer_idがない場合は登録できないこと" do
      user = build(:user)
      user_id = User.first.id
      card = build(:credit_card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idがない場合は登録できないこと" do
      user = build(:user)
      user_id = User.first.id
      card = build(:credit_card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end