require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of identification' do
      user = build(:user, identification: nil)
      user.valid?
      expect(user.errors[:identification]).to include("can't be blank")
    end

    it 'validates presence of username' do
      user = build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'validates presence of number' do
      user = build(:user, number: nil)
      user.valid?
      expect(user.errors[:number]).to include("can't be blank")
    end

    it 'validates presence of email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'validates presence of borndate' do
      user = build(:user, borndate: nil)
      user.valid?
      expect(user.errors[:borndate]).to include("can't be blank")
    end

    it 'validates uniqueness of identification' do
      existing_user = create(:user, identification: '123456789')
      user = build(:user, identification: '123456789')
      user.valid?
      expect(user.errors[:identification]).to include('has already been taken')
    end

    it 'validates uniqueness of username' do
      existing_user = create(:user, username: 'john_doe')
      user = build(:user, username: 'john_doe')
      user.valid?
      expect(user.errors[:username]).to include('has already been taken')
    end

    it 'validates uniqueness of email' do
      existing_user = create(:user, email: 'john@example.com')
      user = build(:user, email: 'john@example.com')
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end
  end

  describe 'enums' do
    it 'defines role enum with values' do
      expect(User.roles.keys).to eq(['student', 'admin', 'teacher'])
    end
  end
end
