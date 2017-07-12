require 'rails_helper'
=begin
As a user
I want to login
So that I can see my data
Given that I have an account
When I enter my username/password
Then I am taken to my user welcome screen
As a user
I want to logout
Because I am done using the app
Given that I have an account and I am logged in
When I click logout
Then Session is destroyed and I am redirected to the login page
=end

RSpec.feature "user can login" do
  context "registered user not yet logged in" do
    let(:user) { create(:user) }
    it "user logs in" do
      visit '/'
      click_on "Login"
      expect(response).to be_success
      expect(current_path).to eq('/login')

      within("form") do
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        click_on "Login"
      end

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.bio)
      expect(page).to have_content("Your Followers")
      expect(page).to have_content("Following")
    end
  end
end
