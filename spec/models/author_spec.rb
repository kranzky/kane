require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { create(:author) }

  describe "Factory" do
    it "is valid" do
      expect(build(:author)).to be_valid
    end
  end

  describe "Validations" do
    it "requires a name" do
      expect(build(:author, name: nil)).to_not be_valid
    end
  end
end
