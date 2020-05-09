FactoryBot.define do
  factory :category do  
    name              {"aaa"}
  end

  factory :item do
    name                    {"test"}
    price                   {"1000"}
    status                  {"1"}
    category_id             {"195"}
    delivery_method         {"1"}
    delivery_from_location  {"10"}
    item_explanation        {"テスト"}
    preparation_day         {"1"}
    delivery_fee            {"1"}
  end
end