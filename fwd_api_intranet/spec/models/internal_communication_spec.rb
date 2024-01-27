require 'rails_helper'

RSpec.describe InternalCommunication, type: :model do
  let(:internal_communication) { FactoryBot.build(:internal_communication) }

  it 'is valid with valid attributes' do
    valid_attributes = FactoryBot.attributes_for(:internal_communication)
    expect(internal_communication).to be_invalid
  end

  it 'has a title' do
    expect(internal_communication.title).to be_present
  end

  it 'has content' do
    expect(internal_communication.content).to be_present
  end

  it 'is associated with a user' do
    expect(internal_communication.user).to be_a(User)
  end

  it 'has a unique title' do
    existing_communication = FactoryBot.create(:internal_communication)
    communication_with_same_title = FactoryBot.build(:internal_communication, title: existing_communication.title)
    expect(communication_with_same_title).to be_invalid
  end



  it 'can be created without a user' do
    communication_without_user = FactoryBot.build(:internal_communication, user: nil)
    expect(communication_without_user).to be_invalid
  end

  it 'can have a valid title' do
    communication_with_valid_title = FactoryBot.build(:internal_communication, title: 'Valid Title')
    expect(communication_with_valid_title).to be_invalid
  end

  it 'can have valid content' do
    communication_with_valid_content = FactoryBot.build(:internal_communication, content: 'Valid content without prohibited words')
    expect(communication_with_valid_content).to be_invalid
  end

  it 'belongs to a user' do
    expect(internal_communication.user).to be_a(User)
  end

end
