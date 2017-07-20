require 'rails_helper'

describe "POST /api/v1/reviews" do
  context "POST a wine review" do
    it "posts review via API" do
      user = create(:user)
      wine = create(:wine)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get "/wines/#{wine.id}"

      expect(page).to have_link("Create Review via API", href: new_api_v1_review)

      click_link "Create Review via API"

      expect(current_path).to eq(new_api_v1_review)

      fill_in "Description", with: "Had better"
      fill_in "Rating", with: 4
      click_button "Create Review"

      expect(response).to eq(201)
      expect(response.body).to eq()
    end
  end

  context "POST a venue review" do
    xit "posts review via API" do
      user = create(:user)
      venue = create(:venue)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get "/venues/#{venue.id}"

      expect(page).to have_link("Create Review via API", href: new_api_v1_review)

      click_link "Create Review via API"

      expect(current_path).to eq(new_api_v1_review)

      fill_in "Description", with: "Had better"
      fill_in "Rating", with: 4
      click_button "Create Review"

      expect(response).to eq(201)
      expect(response.body).to eq()
    end
  end

  context "when not logged in" do
    xit "user cannot review venue via API" do
      venue = create(:venue)
      visit venue_path(venue)

      expect(page).not_to have_content("Review")
    end

    xit "user cannot review wine via API" do
      wine = create(:wine)
      visit wine_path(wine)

      expect(page).not_to have_content("Review")
    end
  end
end
