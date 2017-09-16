require 'rails_helper'

RSpec.feature "Admin deletes user" do
  it "user is deleted" do
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    user_1, user_2 = create_list(:user, 2)

    visit '/'

    click_on("Manage Users")
    within(".user-#{user_1.id}") do
      click_on "Delete"
    end
    expect(page).to_not have_content(user_1.name)
    expect(page).to have_content(user_2.name)
  end
end
