require 'rails_helper'

RSpec.feature "user wants to follow a venue" do
  context "when logged in as a member" do
    let!(:user) { create(:user) }
    let!(:venue) { create(:venue) }
    it "member can follow a venue" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit venues_path

      expect(current_path).to eq("/venues")

      expect(page).to have_link(venue.name)
      click_on(venue.name)

      expect(current_path).to eq(venue_path(venue))
      expect(page).to have_link("Follow Venue")

      click_on("Follow Venue")
      expect(current_path).to eq(venue_path(venue))
      expect(page).to have_content("Venue successfully followed!")
      expect(page).to have_link("Unfollow Venue")
      expect(user.follows.first.target).to eq venue
    end
  end
  context "when not logged in" do
    let(:user) { create(:user) }
    let(:venue) { create(:venue) }
    it "guest cannot see venue follow link" do
      visit venues_path(venue)

      expect(page).to have_content(venue.name)
      click_on(venue.name)

      expect(current_path).to eq(venue_path(venue))
      expect(page).not_to have_link("Follow Venue")
    end
  end
end
