require 'rails_helper'

RSpec.describe Content, type: :model do
  let(:content) { create(:content) }

  let(:url) { content.url }

  describe "Factory" do
    it "is valid" do
      expect(build(:content)).to be_valid
    end
  end

  describe "Validations" do
    it "requires a url" do
      expect(build(:content, url: nil)).to_not be_valid
    end

    it "does not permit duplicate urls" do
      expect(build(:content, url: url)).to_not be_valid
    end
  end
end
