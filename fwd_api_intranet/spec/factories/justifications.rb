FactoryBot.define do
  factory :justification do
    status_justification { Faker::Lorem.word }
    date { Faker::Date.between(from: 1.year.ago, to: Date.today) }
    responsable_id { Faker::Number.unique.between(from: 1, to: 100).to_s }
    association :user
    association :justification_type, factory: :justification_type
  end
end
