require 'rails_helper'

RSpec.describe TypeUser, type: :model do
  let(:type_user) { FactoryBot.build(:type_user) }

  it 'has a valid factory' do
    expect(type_user).to be_valid
  end

  it 'has a valid type_name' do
    expect(type_user.type_name).to eq("MyString")
  end

  it 'has a valid description' do
    expect(type_user.description).to eq("MyText")
  end

  it 'is invalid without a type_name' do
    type_user.type_name = nil
    expect(type_user).to be_invalid
    expect(type_user.errors[:type_name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    type_user.description = nil
    expect(type_user).to be_invalid
    expect(type_user.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with a blank type_name' do
    type_user.type_name = " "
    expect(type_user).to be_invalid
    expect(type_user.errors[:type_name]).to include("can't be blank")
  end

  it 'is invalid with a blank description' do
    type_user.description = " "
    expect(type_user).to be_invalid
    expect(type_user.errors[:description]).to include("can't be blank")
  end



  it 'is valid with a type_name of 255 characters' do
    type_user.type_name = "a" * 255
    expect(type_user).to be_valid
  end

  it 'is valid with a description longer than 1000 characters' do
    type_user.description = "a" * 1001
    expect(type_user).to be_invalid
  end

  it 'is invalid with a description of 1001 characters' do
    type_user.description = "a" * 1001
    expect(type_user).to be_invalid
  end

  it 'is valid with a description of 1000 characters' do
    type_user.description = "a" * 1000
    expect(type_user).to be_valid
  end


end
