require 'rails_helper'

RSpec.feature "Guest Can Create User Account" do
  context "when not logged in" do

  end

  context "when already logged in" do
    let (:user) { create(:user) }
    it "user should be redirected to their profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_user_path

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("You are already logged in.  Logout first to create a new account.")
    end
  end
end
