require 'rails_helper'

RSpec.describe Admonition, type: :model do
  let(:admonition) { FactoryBot.build(:admonition) }


  it 'is invalid without admonition_types_id' do
    admonition.admonition_types_id = nil
    expect(admonition).to be_invalid
  end

  it 'is invalid without user_id' do
    admonition.user_id = nil
    expect(admonition).to be_invalid
  end

  it 'is invalid without date' do
    admonition.date = nil
    expect(admonition).to be_invalid
  end

  it 'is invalid without responsable_id' do
    admonition.responsable_id = nil
    expect(admonition).to be_invalid
  end

  it 'is invalid without status_admonition' do
    admonition.status_admonition = nil
    expect(admonition).to be_invalid
  end

  it 'is invalid with empty status_admonition' do
    admonition.status_admonition = ''
    expect(admonition).to be_invalid
  end

  it 'is invalid with nil status_admonition' do
    admonition.status_admonition = nil
    expect(admonition).to be_invalid
  end


  context 'when creating a record' do
    it 'is invalid with incomplete data' do
      incomplete_admonition = FactoryBot.build(:admonition, admonition_types_id: nil, user_id: nil, date: nil, responsable_id: nil, status_admonition: nil)
      expect(incomplete_admonition).to be_invalid
    end
  end
end
