require 'rails_helper'

RSpec.feature "Guest Can Create User Account" do
  context "when not logged in" do
    it "guest should be able to enter their information" do
      visit root_path

      within ('.hide-on-med-and-down') do
        click_on "Create Account"
      end

      expect(current_path).to eq new_user_path

      fill_in "first_name", with: "FN"
      fill_in "last_name", with: "LN"
      fill_in "username", with: "username"
      fill_in "email", with: "email@email.com"
      fill_in "country-code", with: "1"
      fill_in "phone_number", with: "123-456-7890"
      fill_in "bio", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      fill_in "password", with: "123abc"
      fill_in "password_confrimation", with: "123abc"

      click_on "Submit"

      user = User.last

      expect(current_path).to eq verify_path
      # expect(page).to have_content "Your Account has been created."

      expect(page).to have_content('Just To Be Safe')
      fill_in "code", with: '123456'
      click_on 'Verify Token'

      # TODO stub out authy token
      # expect(current_path).to eq user_path(user)
      # expect(page).to have_content("Hello, #{user.first_name} #{user.last_name}")
      # expect(page).to have_content(user.email)
      # expect(page).to have_content(user.bio)
      # expect(page).to have_content("Your Followers")
      # expect(page).to have_content("Following")
    end
  end

  context "when already logged in" do
    let (:user) { create(:user) }
    it "user should be redirected to their profile" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_user_path

      expect(current_path).to eq(user_path(user))
      # expect(page).to have_content("You are already logged in.  Logout first to create a new account.")
    end
  end
end
