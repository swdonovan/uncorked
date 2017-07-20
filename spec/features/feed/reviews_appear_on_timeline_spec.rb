require 'rails_helper'

RSpec.feature 'reviews show in user timeline' do
  context 'when logged in' do
    let(:user) { create(:user) }
    let!(:venue) { create(:venue) }
    it 'displays that they have reviewed a venue in their feed' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit venue_path(venue)

      click_link "Review"
      fill_in "Description", with: "Nice tannins"
      fill_in "Rating", with: 9
      click_button "Create Review"

      visit users_profile_path

      expect(page).to have_content "News Feed"
      expect(page).to have_content "#{user.first_name} #{user.last_name} reviewed #{venue.name}"
    end
  end
end
