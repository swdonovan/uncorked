require 'rails_helper'

RSpec.feature "user can logout" do
  let(:user) { create(:user) }
  context "signed in user can logout" do
    it "user logs out" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/'

      expect(page).to have_content("Logout")
      click_on("Logout")
      expect(page).to have_content("Successfully Logged out")
      expect(current_path).to eq(login_path)
    end
  end

  context "signed in user cannot logout" do
    it "does not show login button if not logged out" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/'

      expect(page).to_not have_content("Login")
    end
  end
end
