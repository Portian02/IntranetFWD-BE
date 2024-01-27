# En tu modelo app/models/calendar_event.rb
class CalendarEvent < ApplicationRecord
validates :title, presence: true
validates :description, presence: true
validates :url, presence: true
end
