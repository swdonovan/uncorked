require 'rails_helper'

RSpec.describe Badge, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:decription) }
      it { should validate_uniqueness_of(:name) }
      it { should validate_uniqueness_of(:description) }
    end

    context "valid attributes" do
      it "is valid with a name and description" do
        badge = Badge.create(name: "Power User", description: "You have consumed all other lesser users")

        expect(badge).to be_valid
      end
    end

    context "relationships" do
      it "has many users" do
        badge = Badge.create(name: "Power User", description: "You have consumed all other lesser users")

        expect(badge).to respond_to(:users)
      end

      it "has many user badges" do
        badge = Badge.create(name: "Power User", description: "You have consumed all other lesser users")

        expect(badge).to respond_to(:user_badges)
      end
    end
  end
end
