class CalendarEvent < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :date, presence: true
  validates :document, presence: true # Puedes ajustar esta validación según tus necesidades

  # Restricciones adicionales, por ejemplo, validación de formato para la fecha
  validate :date_format

  def date_format
    errors.add(:date, 'must be a valid date') unless date.is_a?(Date)
  end
end
