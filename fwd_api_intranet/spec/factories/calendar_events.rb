FactoryBot.define do
  factory :calendar_event do
    title { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    url { Faker::Internet.url if [true, false].sample }
  end
end

