FactoryBot.define do
  factory :comment do
    sentence      {Faker::Lorem.sentence}
  end
end
