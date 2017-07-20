require 'rails_helper'
=begin
As a user
When I navigate to the wines or venues #show page
I should see a button/link to create API review
And when I click on "Create API Review"
I'll be taken to a new_api_review form
And when I fill in review details (description & rating)
And I click_on submit
I should see a successful message
And I should see all the reviews for that objects (wine/venue#show)
=end
describe "POST /api/v1/reviews" do
  context "POST a wine review" do
    it "posts review via API" do

    end

  end
  context "POST a venue review" do
    it "posts review via API" do

    end
  end

end
