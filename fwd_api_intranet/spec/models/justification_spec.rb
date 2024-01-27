require 'rails_helper'

RSpec.describe Justification, type: :model do
  let(:justification) { FactoryBot.build(:justification) }

  it 'is invalid without status_justification' do
    justification.status_justification = nil
    expect(justification).to be_invalid
    expect(justification.errors[:status_justification]).to include("can't be blank")
  end

  it 'is invalid without date' do
    justification.date = nil
    expect(justification).to be_invalid
    expect(justification.errors[:date]).to include("can't be blank")
  end

  it 'is invalid without responsable_id' do
    justification.responsable_id = nil
    expect(justification).to be_invalid
    expect(justification.errors[:responsable_id]).to include("can't be blank")
  end

  it 'is invalid without user' do
    justification.user = nil
    expect(justification).to be_invalid
    expect(justification.errors[:user]).to include("must exist")
  end

  it 'is invalid without justification_type' do
    justification.justification_type = nil
    expect(justification).to be_invalid
    expect(justification.errors[:justification_type]).to include("must exist")
  end

  it 'belongs to a user' do
    expect(justification.user).to be_a(User)
  end

  it 'belongs to a justification_type' do
    expect(justification.justification_type).to be_a(JustificationType)
  end

  it 'has a valid status_justification' do
    expect(justification.status_justification).to be_a(String)
  end

  it 'has a valid date' do
    expect(justification.date).to be_a(Date)
  end

  it 'has a valid responsable_id' do
    expect(justification.responsable_id).to be_a(String)
  end
end
