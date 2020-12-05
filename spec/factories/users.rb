FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(mix_case: true)}
    password_confirmation {password}
    surname               {person.last.kanji}
    name                  {person.first.kanji}
    surname_furigana      {person.last.katakana}
    name_furigana         {person.first.katakana}
    birthday              {Faker::Date.backward}
  end
end