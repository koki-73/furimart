require 'rails_helper'
describe Item do
  describe '#create' do
    it "全ての項目がある場合は出品できること" do
      user = create(:user)
      category = create(:category)
      item = build(:item, user_id: user[:id], category_id: category[:id])
      expect(item).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, price: "")
      user.valid?
      expect(user.errors[:price]).to include("を入力してください")
    end

    it "statusがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, status: "")
      user.valid?
      expect(user.errors[:status]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, category_id: "")
      user.valid?
      expect(user.errors[:category_id]).to include("を入力してください")
    end

    it "delivery_methodがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, delivery_method: "")
      user.valid?
      expect(user.errors[:delivery_method]).to include("を入力してください")
    end

    it "delivery_from_locationがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, delivery_from_location: "")
      user.valid?
      expect(user.errors[:delivery_from_location]).to include("を入力してください")
    end

    it "item_explanationがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, item_explanation: "")
      user.valid?
      expect(user.errors[:item_explanation]).to include("を入力してください")
    end

    it "preparation_dayがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, preparation_day: "")
      user.valid?
      expect(user.errors[:preparation_day]).to include("を入力してください")
    end

    it "delivery_feeがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, delivery_fee: "")
      user.valid?
      expect(user.errors[:delivery_fee]).to include("を入力してください")
    end

    it "user_idがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      user = build(:item, user_id: nil)
      user.valid?
      expect(user.errors[:user]).to include("を入力してください")
    end
  end
end