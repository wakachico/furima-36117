FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    family_name           {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    family_name_kana      {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end