require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { create(:profile) }

  describe "Factory" do
    it "is valid" do
      expect(build(:profile)).to be_valid
    end
  end

  describe "Validations" do
    it "requires a name" do
      expect(build(:profile, name: nil)).to_not be_valid
    end
  end
end
