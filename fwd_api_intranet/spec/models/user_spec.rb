require 'rails_helper'

# spec/models/user_spec.rb

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of identification' do
      user = User.new
      user.valid?
      expect(user.errors[:identification]).to include("can't be blank")
    end

    it 'validates presence of username' do
      user = User.new
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'validates presence of number' do
      user = User.new
      user.valid?
      expect(user.errors[:number]).to include("can't be blank")
    end

    it 'validates presence of email' do
      user = User.new
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'validates presence of borndate' do
      user = User.new
      user.valid?
      expect(user.errors[:borndate]).to include("can't be blank")
    end
  end

  describe 'enums' do
    it 'defines role enum with values' do
      expect(User.roles.keys).to eq(['student', 'admin', 'teacher'])
    end
  end
end
