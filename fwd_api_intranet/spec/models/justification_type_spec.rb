require 'rails_helper'

RSpec.describe JustificationType, type: :model do
  let(:justification_type) { FactoryBot.build(:justification_type) }

  it 'has a valid factory' do
    expect(justification_type).to be_valid
  end

  it 'has a valid name' do
    expect(justification_type.name).to eq("MyString")
  end

  it 'has a valid description' do
    expect(justification_type.description).to eq("MyText")
  end

  it 'is invalid without a name' do
    justification_type.name = nil
    expect(justification_type).to be_invalid
    expect(justification_type.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    justification_type.description = nil
    expect(justification_type).to be_invalid
    expect(justification_type.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a blank name' do
    justification_type.name = " "
    expect(justification_type).to be_invalid
    expect(justification_type.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a blank description' do
    justification_type.description = " "
    expect(justification_type).to be_invalid
    expect(justification_type.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a name longer than 255 characters' do
    justification_type.name = "a" * 256
    expect(justification_type).to be_invalid
    expect(justification_type.errors[:name]).to include("is too long (maximum is 255 characters)")
  end

  it 'is valid with a name of 255 characters' do
    justification_type.name = "a" * 255
    expect(justification_type).to be_valid
  end

  it 'is valid with a description longer than 1000 characters' do
    justification_type.description = "a" * 1001
    expect(justification_type).to be_valid
  end



  it 'is valid with a description of 1000 characters' do
    justification_type.description = "a" * 1000
    expect(justification_type).to be_valid
  end


end
