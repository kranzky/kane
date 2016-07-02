require 'rails_helper'

RSpec.describe Statistic, type: :model do
  let(:statistic) { create(:statistic) }

  describe "Factory" do
    it "is valid" do
      expect(build(:statistic)).to be_valid
    end
  end

  describe "Validations" do
    it "requires a seen count" do
      expect(build(:statistic, seen_count: nil)).to_not be_valid
    end

    it "requires a view count" do
      expect(build(:statistic, view_count: nil)).to_not be_valid
    end

    it "requires a view duration" do
      expect(build(:statistic, view_seconds: nil)).to_not be_valid
    end

    it "requires a view percentage" do
      expect(build(:statistic, view_percent: nil)).to_not be_valid
    end
  end
end
