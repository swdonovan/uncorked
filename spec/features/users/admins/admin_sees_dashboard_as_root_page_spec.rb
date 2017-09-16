require 'rails_helper'

RSpec.feature "Admin visits root page" do
  it "they see their admin dashboard" do
    admin = create(:user, role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/'
    expect(current_path).to eq('/admin/dashboard')
    expect(page).to have_content("Admin Dashboard")
    
    click_on "Uncorked"
    expect(current_path).to eq('/admin/dashboard')
    expect(page).to have_content("Admin Dashboard")
  end
end
