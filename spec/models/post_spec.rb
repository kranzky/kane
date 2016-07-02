require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  describe "Factory" do
    it "is valid" do
      expect(build(:post)).to be_valid
    end
  end

  describe "Validations" do
    it "requires a url" do
      expect(build(:post, url: nil)).to_not be_valid
    end
  end
end
