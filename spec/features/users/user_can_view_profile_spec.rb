require 'rails_helper'

RSpec.feature "user can view profile" do
  context "when logged in" do
    let(:user) { create(:user) }
    it "user sees their profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/'

      expect(page).to have_content("Hello, #{user.first_name} #{user.last_name}")
      expect(page).to have_content("Logout")
      expect(page).not_to have_content("Login")

      click_on "#{user.first_name} #{user.last_name}"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.bio)
      expect(page).to have_content("Your Followers")
      expect(page).to have_content("Following")
    end
  end

  context "when not logged in" do
    it "user is redirected to login"

  end
end
