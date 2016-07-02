require 'rails_helper'

RSpec.describe Source, type: :model do
  let(:source) { create(:source) }

  let(:name) { source.name }
  let(:url) { source.url }

  describe "Factory" do
    it "is valid" do
      expect(build(:source)).to be_valid
    end
  end

  describe "Validations" do
    it "requires a name" do
      expect(build(:source, name: nil)).to_not be_valid
    end

    it "does not permit duplicate names" do
      expect(build(:source, name: name)).to_not be_valid
    end

    it "requires a url" do
      expect(build(:source, url: nil)).to_not be_valid
    end

    it "does not permit duplicate urls" do
      expect(build(:source, url: url)).to_not be_valid
    end
  end
end
