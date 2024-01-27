FactoryBot.define do
  factory :user do
    identification { Faker::IDNumber.unique.south_african_id_number }
    username { Faker::Internet.unique.username }
    number { Faker::PhoneNumber.unique.phone_number }
    email { Faker::Internet.unique.email(domain: 'fwdcostarica.com') }
    borndate { Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%Y-%m-%d') }
    role { User.roles.keys.sample }
    association :type_user, factory: :type_user


    after(:build) do |user|
      user.password ||= 'fwd1234'
    end
  end
end
