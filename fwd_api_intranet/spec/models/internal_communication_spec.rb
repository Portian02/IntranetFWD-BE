
require 'rails_helper'

RSpec.describe InternalCommunication, type: :model do
  let(:internal_communication) { FactoryBot.build(:internal_communication) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(internal_communication).to be_valid
    end

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user_id) }
  end

  describe "factory" do
    it "is valid" do
      internal_communication = FactoryBot.create(:internal_communication)
      expect(internal_communication).to be_valid
    end
  end
end
