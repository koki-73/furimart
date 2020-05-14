require 'rails_helper'
describe Profile do
  describe '#create' do
    it "全ての項目がある場合は登録できること" do
      user = create(:user)
      user_id = User.first.id
      profile = build(:profile, user_id: user_id)
      expect(profile).to be_valid
    end

    it "post_codeがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      profile = build(:profile, user_id: user_id, post_code: "")
      profile.valid?
      expect(profile.errors[:post_code]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      profile = build(:profile, user_id: user_id, prefecture_id: "")
      profile.valid?
      expect(profile.errors[:prefecture_id]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      profile = build(:profile, user_id: user_id, city: "")
      profile.valid?
      expect(profile.errors[:city]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      user = create(:user)
      user_id = User.first.id
      profile = build(:profile, user_id: user_id, address: "")
      profile.valid?
      expect(profile.errors[:address]).to include("を入力してください")
    end

  end
end