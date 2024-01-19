require 'rails_helper'


RSpec.describe CalendarEvent, type: :model do
  describe 'validations' do
    it 'validates presence of title' do
      event = CalendarEvent.new
      event.valid?
      expect(event.errors[:title]).to include("can't be blank")
    end

    it 'validates presence of description' do
      event = CalendarEvent.new
      event.valid?
      expect(event.errors[:description]).to include("can't be blank")
    end

    it 'validates presence of document' do
      event = CalendarEvent.new
      event.valid?
      expect(event.errors[:document]).to include("can't be blank")
    end
  end
end
