FactoryBot.define do
  factory :order_address do
    postal_code   { Faker::Number.number(digits: 3).to_s + "-" + Faker::Number.number(digits: 4).to_s }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Gimei.address.city.kanji }
    block         { Gimei.address.town.kanji + Faker::Number.number(digits: 1).to_s + "-" + Faker::Number.number(digits: 1).to_s }
    building      { '東京ハイツ' }
    phone_number  { Faker::Number.number(digits: 10) }
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
