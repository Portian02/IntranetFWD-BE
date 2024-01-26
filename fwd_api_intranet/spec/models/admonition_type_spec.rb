

require 'rails_helper'

RSpec.describe AdmonitionType, type: :model do
  let(:admonition_type) { FactoryBot.build(:admonition_type) }

  it 'has a valid factory' do
    expect(admonition_type).to be_valid
  end

  it 'has a valid name' do
    expect(admonition_type.name).to eq("MyString")
  end

  it 'has a valid description' do
    expect(admonition_type.description).to eq("MyText")
  end

  it 'is invalid without a name' do
    admonition_type.name = nil
    expect(admonition_type).to be_invalid
    expect(admonition_type.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    admonition_type.description = nil
    expect(admonition_type).to be_invalid
    expect(admonition_type.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a blank name' do
    admonition_type.name = " "
    expect(admonition_type).to be_invalid
    expect(admonition_type.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a blank description' do
    admonition_type.description = " "
    expect(admonition_type).to be_invalid
    expect(admonition_type.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a name longer than 255 characters' do
    admonition_type.name = "a" * 256
    expect(admonition_type).to be_invalid
    expect(admonition_type.errors[:name]).to include("is too long (maximum is 255 characters)")
  end

  it 'is valid with a name of 255 characters' do
    admonition_type.name = "a" * 255
    expect(admonition_type).to be_valid
  end

  it 'is valid with a description longer than 1000 characters' do
    admonition_type.description = "a" * 1001
    expect(admonition_type).to be_valid
  end



  it 'is valid with a description of 1000 characters' do
    admonition_type.description = "a" * 1000
    expect(admonition_type).to be_valid
  end


end
