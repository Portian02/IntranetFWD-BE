# En tu modelo app/models/calendar_event.rb
class CalendarEvent < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }
  validates :url, url_format: { allow_blank: true }
end

