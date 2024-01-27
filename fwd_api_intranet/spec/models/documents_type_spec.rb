require 'rails_helper'

RSpec.describe 'DocumentsType' do
  let(:documents_type) { FactoryBot.build(:documents_type) }

  it 'is valid with valid attributes' do
    expect(documents_type).to be_valid
  end

  it 'has a valid type_name' do
    expect(documents_type.type_name).to match(/Document Type \d+/)
  end

  it 'has a valid description' do
    expect(documents_type.description).to be_present
  end

  it 'is not valid without a type_name' do
    documents_type.type_name = nil
    expect(documents_type).to_not be_valid
  end

  it 'is not valid without a description' do
    documents_type.description = nil
    expect(documents_type).to_not be_valid
  end

  it 'is not valid with a description exceeding 500 characters' do
    documents_type.description = 'a' * 501
    expect(documents_type).to_not be_valid
  end

  it 'generates unique type_names' do
    type_names = 5.times.map { FactoryBot.build(:documents_type).type_name }
    expect(type_names).to match_array(type_names.uniq)
  end



  it 'is not valid if type_name is not unique' do
    FactoryBot.create(:documents_type, type_name: documents_type.type_name)
    expect(documents_type).to_not be_valid
  end

  it 'is not valid if description is not unique' do
    FactoryBot.create(:documents_type, description: documents_type.description)
    expect(documents_type).to_not be_invalid
  end
end
