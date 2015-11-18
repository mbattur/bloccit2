require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe ".update_rating" do
    it "creates a non-existent rating" do
      expect(Rating.update_rating("PG")).to_not be_nil
    end
  end
end