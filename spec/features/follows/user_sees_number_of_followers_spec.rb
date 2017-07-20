require 'rails_helper'

RSpec.feature "user wants to see the count of followers" do
  context "when logged in as a member who is followed" do
    let!(:follow) { create(:follow, :a_user) }
    it "member can see followers on profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(follow.target)

      visit user_path(follow.target)

      expect(page).to have_content("Followers: 1")
    end
  end
end
