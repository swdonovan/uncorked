require 'rails_helper'

RSpec.feature "user wants to see their number of follows" do
  context "when logged in as a member with follows" do
    let(:user) { create(:user) }
    let!(:follow) { create_list(:follow, 3, :a_venue, user: user) }
    it "member can see follows on profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content("Following: 3")
    end
  end
  context "when there are other users who follow things" do
    let(:user) { create(:user) }
    let!(:follow) { create_list(:follow, 1, :a_venue, user: user) }
    let!(:other_follow) { create_list(:follow, 5, :a_venue) }
    it "member can see only their follows on profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content("Following: 1")
    end
  end
end
