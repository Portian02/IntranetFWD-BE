
FactoryBot.define do
  factory :calendar_event do
    name { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph }
    document { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'example_document.pdf'), 'application/pdf') }

    # Agrega una secuencia para evitar nombres duplicados
    sequence(:name) { |n| "Event #{n}" }

    # Agrega una secuencia para evitar documentos duplicados
    sequence(:document) { |n| Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', "document_#{n}.pdf"), 'application/pdf') }
  end
end

