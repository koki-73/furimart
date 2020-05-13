require 'rails_helper'
describe Item do
  describe '#create' do
    it "全ての項目がある場合は出品できること" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id)
      expect(item).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "priceがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "priceが299以下の場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end

    it "priceが300以上の場合は登録できること" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, price: "300")
      expect(item).to be_valid
    end

    it "priceが9999999以上の場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "priceが9999999以上の場合は登録できること" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, price: "9999999")
      expect(item).to be_valid
    end

    it "statusがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, status: "")
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "delivery_methodがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, delivery_method: "")
      item.valid?
      expect(item.errors[:delivery_method]).to include("を入力してください")
    end

    it "delivery_from_locationがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, delivery_from_location: "")
      item.valid?
      expect(item.errors[:delivery_from_location]).to include("を入力してください")
    end

    it "item_explanationがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, item_explanation: "")
      item.valid?
      expect(item.errors[:item_explanation]).to include("を入力してください")
    end

    it "preparation_dayがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, preparation_day: "")
      item.valid?
      expect(item.errors[:preparation_day]).to include("を入力してください")
    end

    it "delivery_feeがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, user_id: user_id, category_id: category_id, delivery_fee: "")
      item.valid?
      expect(item.errors[:delivery_fee]).to include("を入力してください")
    end

    it "user_idがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      category = create(:category)
      category_id = Category.first.id
      item = build(:item, category_id: category_id, user_id: nil)
      item.valid?
      expect(item.errors[:user]).to include("を入力してください")
    end
  end
end