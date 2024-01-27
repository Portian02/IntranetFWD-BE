FactoryBot.define do
  factory :admonition do
    status_admonition { Faker::Lorem.word }
    date { Faker::Date.between(from: 1.year.ago, to: Date.today) }
    responsable_id { Faker::Number.unique.between(from: 1, to: 100).to_s }
    association :user
    association :admonition_type, factory: :admonition_type
  end
end
