FactoryBot.define do
  factory :announcement do
    content { Faker::Lorem.sentence }
    date { Faker::Date.between(from: 1.year.ago, to: 1.year.from_now) }
    description { Faker::Lorem.paragraph }

    trait :invalid do
      content { nil }
      date { nil }
      description { nil }
    end
  end
end
