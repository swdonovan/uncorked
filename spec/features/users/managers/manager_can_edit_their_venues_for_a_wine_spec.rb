require 'rails_helper'

RSpec.feature 'Managers can edit venues a wine is listed on' do
  let!(:wine) { create(:wine) }
  let!(:venue) { create(:venue, wines: [wine] )}
  let!(:venue2) { create(:venue, wines: [wine] )}
  let!(:other_venue) { create(:venue, wines: [wine] )}

  context 'when logged in as a manager' do
    let(:manager) { create(:user, :as_manager)}

    context 'when the wine is already part of the venue wines list' do
      before { manager.venues << venue }
      before { manager.venues << venue2 }
      it 'manager can edit which venues carry the wine' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(manager)

        visit wine_path(wine)

        expect(page).to have_content venue.name
        expect(page).to have_content venue2.name
        expect(page).to have_content other_venue.name

        expect(page).to have_link "Edit Venues", href: wine_edit_venues_path(wine)

        click_on "Edit Venues"

        expect(page).to have_content "Select/deselect the venues where you would like to list/unlist #{wine.name}:"

        uncheck venue.name

        click_on "Update Venues with #{wine.name}"

        expect(current_path).to eq wine_path(wine)
        expect(page).to have_content "The venues with this wine has been successfully updated."
        expect(page).not_to have_content venue.name
        expect(page).to have_content venue2.name
        expect(page).to have_content other_venue.name
      end
    end
  end

  context 'when not logged in as a manager' do
    let(:member) { create(:user) }

    it "user cannot see remove from venue link" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(member)

      visit wine_path(wine)

      expect(page).not_to have_content "Remove from Venue"
    end

    it "guest cannot see remove from venue link" do
      visit wine_path(wine)

      expect(page).not_to have_content "Remove from Venue"
    end
  end
end
