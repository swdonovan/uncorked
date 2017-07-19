require 'rails_helper'

RSpec.feature "user wants to view timeline of followed feeds" do

  context 'when logged in as a member' do
    let(:user) { create(:user) }
    context 'when there is no activity' do
      it 'the user sees that they have no activity' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit user_path(user)

        expect(page).to have_content "News Feed"
        expect(page).to have_content "No activity."
      end
    end
    context "when a user they follow follows a venue" do
      let!(:follow) { create(:follow, :a_user) }
      let!(:follow_venue) { create(:follow, :a_venue, user: follow.target)}
      it "the user sees can see another the follow" do
        user = follow.user
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit user_path(user)

        expect(page).to have_content "News Feed"
        expect(page).to have_content "#{follow.target.first_name} #{follow.target.last_name} followed #{follow_venue.target.name}"
      end
    end
  end
end
