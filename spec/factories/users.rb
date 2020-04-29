FactoryBot.define do

  factory :user do
    nickname              {"test"}
    email                 {"test@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    family_name           {"高橋"}
    first_name            {"奏"}
    family_name_kana      {"タカハシ"}
    first_name_kana       {"カナ"}
    birth_day             {"1992-12-03"}
  end

end

# user = User.new(nickname: "aa", email: "kkkgmail.com", password: "0000000", password_confirmation: "00000000", family_name: "高橋", first_name: "奏", family_name_kana: "タカハシ", first_name_kana: "カナ", birth_day: "1992-12-03")