require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  let(:name) { user.name }

  describe "Factory" do
    it "is valid" do
      expect(build(:user)).to be_valid
    end
  end

  describe "Validations" do
    it "requires a name" do
      expect(build(:user, name: nil)).to_not be_valid
    end

    it "does not permit duplicate names" do
      expect(build(:user, name: name)).to_not be_valid
    end
  end
end
