class CalendarEvent < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :document, presence: true # Puedes ajustar esta validación según tus necesidades



end
