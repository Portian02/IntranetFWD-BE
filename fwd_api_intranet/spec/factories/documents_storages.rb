FactoryBot.define do

  factory :documents_storage do
    sequence(:name) { |n| "Document #{n}" }
    description { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    association :documents_type

    trait :invalid do
      name { nil }
      description { nil }
      url { nil }
      documents_type { nil }
    end
  end
end
