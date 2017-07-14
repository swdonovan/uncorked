require 'rails_helper'

RSpec.describe Venue, type: :model do
  context "relationships" do
    it "has many user_venues" do
      venue = create(:venue)

      expect(venue).to respond_to(:user_venues)
    end

    it "has many users" do
      venue = create(:venue)

      expect(venue).to respond_to(:managers)
    end
  end
end
