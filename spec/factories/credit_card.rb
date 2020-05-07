FactoryBot.define do

  factory :credit_card do
    customer_id {"test_customer_id"}
    card_id     {"test_card_id"}
  end

  # card = CreditCard.new(user_id: 5, customer_id: "", card_id: "test_card_id")
  # card = CreditCard.new(user_id: 5, customer_id: "test_customer_id", card_id: "")
end