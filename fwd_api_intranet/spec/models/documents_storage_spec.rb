require 'rails_helper'

RSpec.describe DocumentsStorage, type: :model do
  describe 'validations' do


    it 'is invalid without a name' do
      expect(build(:documents_storage, name: nil)).to be_invalid
    end

    it 'is invalid without a description' do
      expect(build(:documents_storage, description: nil)).to be_invalid
    end

    it 'is invalid without a URL' do
      expect(build(:documents_storage, url: nil)).to be_invalid
    end

    it 'is invalid without a documents type' do
      expect(build(:documents_storage, documents_type: nil)).to be_invalid
    end

    it 'creates a valid instance with the :invalid trait' do
      expect(build(:documents_storage, :invalid)).to be_invalid
    end
  end

  describe 'associations' do
    it 'belongs to a documents type' do
      association = described_class.reflect_on_association(:documents_type)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
