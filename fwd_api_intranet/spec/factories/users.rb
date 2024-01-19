FactoryBot.define do
  factory :user do
    sequence(:identification) { |n| "ID#{n}" }
    sequence(:username) { |n| "user#{n}" }
    sequence(:number) { |n| n }
    sequence(:email) { |n| Faker::Internet.email }
    borndate { Faker::Date.birthday }
    password { 'password123' }
    password_confirmation { 'password123' }
    role { :student }

    trait :admin do
      role { :admin }
    end

    trait :teacher do
      role { :teacher }
    end

    factory :admin_user, traits: [:admin]
    factory :teacher_user, traits: [:teacher]
  end
end
