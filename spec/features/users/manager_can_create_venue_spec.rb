require 'rails_helper'


RSpec.feature "Managers can create venues" do
  context "when logged in as a manager"
  context "when logged in as a member"

  context "when not logged in as a manager" do
    context "as a guest" do
      it "guests cannot see venue creation link" do
        visit root_path

        expect(page).not_to have_link "Add Venue", href: new_venue_path
      end
      it "redirects the guest to the homepage with a message" do

      end
    end
    context "as a member" do
      let(:member) { create(:user) }
      it "user cannot see venue creation link" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(member)

        visit root_path

        expect(page).not_to have_link "Add Venue", href: new_venue_path
      end
      it "displays the member to the homepage with a message" do

      end
    end
  end
end
