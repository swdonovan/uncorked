require 'rails_helper'

RSpec.feature 'user wants to follow a user' do
  context 'when logged in as a member' do
    let!(:user) { create(:user) }
    let!(:user2) { create(:user) }
    scenario "member can follow a user" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user2)

      expect(page).to have_link("Follow User")

      click_on("Follow User")
      expect(current_path).to eq(user_path(user2))
      # expect(page).to have_content("Wine successfully followed!")
      expect(page).to have_link("Unfollow User")
      expect(user.follows.first.target).to eq user2
    end
  end
  context "when not logged in" do
    let(:user2) { create(:user) }
    scenario "guest cannot see user follow link" do
      visit user_path(user2)

      expect(page).to have_content(user2.first_name)

      expect(page).not_to have_link("Follow User")
    end
  end
end
