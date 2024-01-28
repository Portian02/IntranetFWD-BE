require 'rails_helper'

RSpec.describe Announcement, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(build(:announcement)).to be_valid
    end

    it 'is invalid without content' do
      expect(build(:announcement, content: nil)).to be_invalid
    end

    it 'is invalid without date' do
      expect(build(:announcement, date: nil)).to be_invalid
    end

    it 'is invalid without description' do
      expect(build(:announcement, description: nil)).to be_invalid
    end

    it 'creates a valid instance with the :invalid trait' do
      expect(build(:announcement, :invalid)).to be_invalid
    end
  end

  describe 'attributes' do
    it 'generates a content with a sentence' do
      expect(build(:announcement).content).to be_a(String)
    end

    it 'generates a date within the past year and the next year' do
      announcement = build(:announcement)
      expect(announcement.date).to be_between(1.year.ago, 1.year.from_now)
    end

    it 'generates a description with a paragraph' do
      expect(build(:announcement).description).to be_a(String)
    end
  end

  describe 'associations' do
    # Add association tests if any associations are defined for Announcement model
  end

  describe 'factory traits' do
    it 'creates an invalid announcement with the :invalid trait' do
      expect(build(:announcement, :invalid)).to be_invalid
    end
  end
end
