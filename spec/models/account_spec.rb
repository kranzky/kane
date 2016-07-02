require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { create(:account) }

  describe "Factory" do
    it "is valid" do
      expect(build(:account)).to be_valid
    end
  end

  describe "Validations" do
    it "requires a subscribed value" do
      expect(build(:account, subscribed: nil)).to_not be_valid
    end

    it "requires a credits value" do
      expect(build(:account, credits: nil)).to_not be_valid
    end
  end
end
