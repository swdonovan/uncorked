require 'rails_helper'

RSpec.feature 'user wants to unfollow a venue' do
  context 'when logged in as a member and following a venue' do
    let(:user) {create(:user)}
    let(:venue) {create(:venue)}
    let!(:follow) {create(:follow, user: user, target: venue)}

    it "member can unfollow a venue" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit venue_path(venue)

      expect(page).to have_link("Unfollow Venue")

      click_on("Unfollow Venue")
      expect(current_path).to eq(venue_path(venue))
      # expect(page).to have_content("Venue successfully unfollowed!")
      expect(page).to have_link("Follow Venue")
      expect(user.followed_venues).to be_empty
    end
  end
end
