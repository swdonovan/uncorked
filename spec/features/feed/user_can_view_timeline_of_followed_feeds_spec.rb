require 'rails_helper'

RSpec.feature "user wantes to view timeline of followed feeds" do

  context 'when logged in as a member' do
    let(:user) { create(:user) }
    context 'when there is no activity' do
      xit 'the user sees that they have no activity' do

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit user_feed_path(@user)

        expect(page).to have_content "News Feed"
        expect(page).to have_content "No activity."
      end
    end
  end
end
