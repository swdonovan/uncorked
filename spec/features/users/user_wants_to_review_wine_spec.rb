require 'rails_helper'

RSpec.feature "user wants to review wine" do
  context "when logged in" do
    let(:user) { create(:user) }
    let!(:wine) { create_list(:wine, 3)}
    it "user can review wine in the DB" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      test_wine = Wine.first

      visit wines_path


      page.assert_selector('.wines', :count => 1)

      expect(html_wines.count).to eq(3)

      page.assert_selector('.wines', :count => 1)


      within '.wines' do
        click_on test_wine.name
      end

      expect(current_path).to eq(wine_path(test_wine))

      click_link "Review Wine"

<<<<<<< HEAD

      expect(current_path).to eq(wine_review_path(test_wine))
      click_button "Review"


      expect(current_path).to eq(wine_review_path(test_wine))
      binding.pry
=======
      expect(current_path).to eq(add_review_path(test_wine))

>>>>>>> add reviews views directory
      fill_in "Description", with: "Nice tannins"
      fill_in "Rating", with: 9
      click_button "Submit Review"

      expect(page).to have_content("Review successfully submitted!")
      expect(current_path).to eq(wine_path(test_wine))
    end
  end

  context "when not logged in" do
    xit "user is redirected to login" do
    end
  end

end
