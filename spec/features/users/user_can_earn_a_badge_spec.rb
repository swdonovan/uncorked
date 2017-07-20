require 'rails_helper'

RSpec.feature "User can earn a badge" do
  context "when logged in" do
    context "after leaving 10 reviews" do
      let!(:user) { create(:user) }
      let!(:wine_0) { create(:wine) }
      let(:wine_1) { create_list(:wine, 2) }
      let(:wine_2) { create_list(:wine, 2) }
      let(:venue_0) { create(:venue) }
      let(:venue_1) { create_list(:venue, 2) }
      let(:venue_2) { create_list(:venue, 2) }
      it "you earn a badge" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        rating = (1..10).to_a
        desc = "It was nice"

        wine_0.reviews.create(user_id: user.id, rating: rating.sample, description: desc)
        wine = wine_1.first
        wine.reviews.create(user_id: user.id, rating: rating.sample, description: desc)
        wine = wine_1.last
        wine.reviews.create(user_id: user.id, rating: rating.sample, description: desc)
        wine = wine_2.first
        wine.reviews.create(user_id: user.id, rating: rating.sample, description: desc)
        wine = wine_2.last
        wine.reviews.create(user_id: user.id, rating: rating.sample, description: desc)

        venue_0.reviews.create(user_id: user.id, rating: rating.sample, description: desc)
        venue = venue_1.first
        venue.reviews.create(user_id: user.id, rating: rating.sample, description: desc)
        venue = venue_1.last
        venue.reviews.create(user_id: user.id, rating: rating.sample, description: desc)
        venue = venue_2.first
        venue.reviews.create(user_id: user.id, rating: rating.sample, description: desc)
        venue = venue_2.last
        venue.reviews.create(user_id: user.id, rating: rating.sample, description: desc)

        expect(user).to respond_to(:reviews)
        expect(user).to respond_to(:badges)
        expect(user.reviews.count).to eq(10)
        expect(user.badges.count).to eq(1)
      end

      it "you earn a badge and it appears on your profile" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        10.times do
          counter = 1

          visit '/wines'

          click_link wine_0.name

          click_link "Review"

          fill_in "Description", with: "Nice tannins"
          fill_in "Rating", with: counter

          click_button "Create Review"

          counter +=1
        end

        visit user_path(user)

        expect(page).to have_content("All Star Reviewer")
      end
    end
  end
end
