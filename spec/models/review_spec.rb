require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it { should validate_presence_of(:rating)}
      it { should validate_presence_of(:description)}
      it { should validate_presence_of(:user_id)}
      it { should validate_presence_of(:reviewable_type)}
      it { should validate_presence_of(:reviewable_id)}
    end

    context "valid attributes" do
      let(:wine) { create(:wine) }
      let(:user) { create(:user) }
      it "is valid with a rating, description, user_id, reviewable_type and reviewable_id" do
        review = wine.reviews.create(rating: 9, description: "YUUC", user_id: user.id)

        expect(review).to be_valid
      end
    end

    context "relationships" do
      let!(:wine) { create(:wine) }
      let!(:user) { create(:user) }
      it "belongs to user" do
        user = create(:user)
        review = wine.reviews.create(rating: 9, description: "YUUC", user_id: user.id)

        expect(review).to respond_to(:user)
      end

      it "belongs to reviewable" do
        user = create(:user)
        review = wine.reviews.create(rating: 9, description: "YUUC", user_id: user.id)

        expect(review).to respond_to(:user)
      end
    end
  end
end
