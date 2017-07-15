require 'rails_helper'

RSpec.feature 'Managers can add a wine to their venue' do
  let!(:wine) { create(:wine) }
  let!(:venue) { create(:venue, wines << wine )}
  context 'when logged in as a manager' do
    let(:manager) { create(:user, :as_manager, venues << venue)}
    context 'when the wine is already part of the venue wines list' do
      it 'manager can click "Remove from Venue" and the wine is no longer on the list'
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
