require 'rails_helper'

RSpec.feature 'user wants to follow a wine' do
  context 'when logged in as a member' do
    let!(:user) { create(:user) }
    let!(:wine) { create(:wine) }
    scenario "member can follow a wine" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit wines_path

      expect(current_path).to eq("/wines")

      expect(page).to have_link(wine.name)
      click_on(wine.name)

      expect(current_path).to eq(wine_path(wine))
      expect(page).to have_link("Follow Wine")

      click_on("Follow Wine")
      expect(current_path).to eq(wine_path(wine))
      # expect(page).to have_content("Wine successfully followed!")
      expect(page).to have_link("Unfollow Wine")
      expect(user.follows.first.target).to eq wine
    end
  end
  context "when not logged in" do
    let(:user) { create(:user) }
    let(:wine) { create(:wine) }
    scenario "guest cannot see wine follow link" do
      visit wines_path(wine)

      expect(page).to have_content(wine.name)
      click_on(wine.name)

      expect(current_path).to eq(wine_path(wine))
      expect(page).not_to have_link("Follow Wine")
    end
  end
end
