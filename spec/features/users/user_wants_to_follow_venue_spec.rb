require 'rails_helper'
=begin
As a registered user that is logged in
And I want to follow to a venue that is in the db
When I visit the venue index page
And I search for a venue
I should see the individual venue show page
And a link to follow
And when I click the link to follow
I should see a successful message
And I should be following the venue
=end

RSpec.feature "user wants to follow a venue" do
  context "when logged in as a member" do
    let(:user) { create(:user) }
    let(:venue) { create(:venue) }
    it "member can follow a venue" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit venues_path
      expect(current_path).to eq("/venues")
      expect(page).to have_content(venue.name)
      click_on(venue.name)

      expect(current_path).to eq(venue_path(venue))
      expect(page).to have_link("Follow Venue")

      click_on("Follow Venue")
      expect(page).to have_content("Venue successfully followed!")
      expect(current_path).to eq(user_venues_path(user))
    end
  end
  context "when not logged in" do
    let(:user) { create(:user) }
    let(:venue) { create(:venue) }
    xit "guest cannot see venue follow link" do
      visit venues_path(venue)

      expect(page).to have_content(venue.name)
      click_on(venue.name)

      expect(current_path).to eq(venue_path(venue))
      expect(page).not_to have_link("Follow Venue")
    end
    xit "guest is redirected back to homepage with a message" do
      visit user_venues_path(user)

      expect(current_path).to eq(root_path)
      expect(page).to have_content("You do not have permissions to access this page.")
    end
  end
end