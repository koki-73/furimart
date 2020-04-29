require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: "", email: "test@gmeil.com", password: "00000000", password_confirmation: "00000000", family_name: "高橋", first_name: "奏", family_name_kana: "タカハシ", first_name_kana: "カナ", birth_day: "1992-12-03")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
end
