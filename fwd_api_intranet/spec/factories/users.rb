# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    sequence(:identification) { |n| "ID#{n}" }
    sequence(:username) { |n| "user#{n}" }
    sequence(:number) { |n| "Number#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    borndate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    password { 'password123' }
    password_confirmation { 'password123' }

    trait :student do
      role { :student }
    end

    trait :admin do
      role { :admin }
    end

    trait :teacher do
      role { :teacher }
    end
  end
end
