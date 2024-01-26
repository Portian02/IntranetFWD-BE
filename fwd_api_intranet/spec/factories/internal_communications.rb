FactoryBot.define do
  factory :internal_communication do
    sequence(:title) { |n| "Internal Communication #{n}" }
    content { Faker::Lorem.sentence }
    association :user, factory: :user
  end
end
