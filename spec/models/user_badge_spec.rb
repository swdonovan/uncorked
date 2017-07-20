require 'rails_helper'

RSpec.describe UserBadge, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it { should validate_presence_of(:badge_id) }
      it { should validate_presence_of(:user_id) }
    end

    context "valid attributes" do
      let(:user) { create(:user)}
      it "is valid with a badge and user id" do
        badge = Badge.create(name: "Winner", description: "You won")
        user_badge = UserBadge.create(badge_id: badge.id, user_id: user.id)

        expect(user_badge).to be_valid
      end
    end

    context "relationships" do
      let(:user) { create(:user)}
      it "belongs to user" do
        badge = Badge.create(name: "Winner", description: "You won")
        user_badge = UserBadge.create(badge_id: badge.id, user_id: user.id)

        expect(user_badge).to respond_to(:user)
      end

      it "belongs to  badge" do
        badge = Badge.create(name: "Winner", description: "You won")
        user_badge = UserBadge.create(badge_id: badge.id, user_id: user.id)

        expect(user_badge).to respond_to(:badge)
      end
    end
  end
end
