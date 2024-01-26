# spec/factories/documents_types.rb
FactoryBot.define do
  factory :documents_type do
    sequence(:type_name) { |n| "Document Type #{n}" }
    description { "Lorem ipsum dolor sit amet, consectetur adipiscing elit." }
  end
end
