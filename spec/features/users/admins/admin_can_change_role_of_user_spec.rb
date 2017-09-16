require 'rails_helper'

RSpec.feature "Admin edits role of user" do
  it "can change default user to manager or admin" do
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    user_1, user_2 = create_list(:user, 2)

    visit '/'
    expect(page).to have_content("Admin Dashboard")

    click_on("Manage Users")
    within(".user-#{user_1.id}") do
      expect(page).to have_content("Member")
      click_on "Make Manager"
      expect(page).to have_content("Manager")
      expect(page).to_not have_content("Member")
      click_on "Make Admin"
      expect(page).to have_content("Admin")
      expect(page).to_not have_content("Manager")
      click_on "Make Member"
      expect(page).to have_content("Member")
      expect(page).to_not have_content("Manager")
      expect(page).to_not have_content("Admin")
    end
  end
end
