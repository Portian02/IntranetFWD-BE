require 'rails_helper'

RSpec.describe CalendarEvent, type: :model do
  let(:valid_attributes) do
    {
      title: Faker::Lorem.sentence(word_count: 3),
      description: Faker::Lorem.paragraph(sentence_count: 2),
      url: Faker::Internet.url
    }
  end

  describe 'validations' do
    let(:calendar_event) { FactoryBot.build(:calendar_event, valid_attributes) }

    it 'is valid with valid attributes' do
      expect(calendar_event).to be_valid
    end

    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(255) }
    it { should validate_length_of(:description).is_at_most(1000) }
    it { should allow_value('http://example.com').for(:url) }
    it { should_not allow_value('invalid_url').for(:url) }
    it { should validate_uniqueness_of(:title) }

  end

  describe 'factory' do
    it 'is valid' do
      calendar_event = FactoryBot.create(:calendar_event)
      expect(calendar_event).to be_valid
    end
  end
end
