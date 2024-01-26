# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }



  it 'has a valid identification' do
    expect(user.identification).to be_a(String)
  end

  it 'has a valid username' do
    expect(user.username).to be_a(String)
  end

  it 'has a valid number' do
    expect(user.number).to be_a(String)
  end

  it 'has a valid email' do
    expect(user.email).to match(/\A[^@\s]+@fwdcostarica\.com\z/)
  end

  it 'has a valid borndate' do
    expect(user.borndate).to be_a(Date)
  end

  it 'has a valid role' do
    expect(user.role).to be_in(User.roles.keys)
  end

  it 'has a valid type_user association' do
    expect(user.type_user).to be_a(TypeUser)
  end

  it 'is invalid without an identification' do
    user.identification = nil
    expect(user).to be_invalid
    expect(user.errors[:identification]).to include("can't be blank")
  end

  it 'is invalid without a username' do
    user.username = nil
    expect(user).to be_invalid
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'is invalid without a number' do
    user.number = nil
    expect(user).to be_invalid
    expect(user.errors[:number]).to include("can't be blank")
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).to be_invalid
    expect(user.errors[:email]).to include("can't be blank")
  end


end
