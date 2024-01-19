
FactoryBot.define do
  factory :internal_communication do
    title { "Sample Title" }
    content { "Sample Content" }
    association :user, factory: :user # Asegúrate de tener un factory para el modelo User
  end
end
