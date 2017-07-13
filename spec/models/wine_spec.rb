require 'rails_helper'

RSpec.describe Wine, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:vintage) }
      it { should validate_presence_of(:rating) }
      it { should validate_uniqueness_of(:name) }
    end

    context "valid attributes" do
      it "is valid with a name, varietal, vintage, vineyard, description and rating" do
        wine = create(:wine)

        expect(wine).to be_valid
      end
    end

    context "relationships" do
      xit "belongs to ..." do
        wine = create(:wine)

        expect(user).to respond_to(:model)
      end

      xit "has many ..." do
        wine = create(:wine)

        expect(wine).to respond_to(:model)
      end
    end

    context "Factory" do
      it "should be a wine" do
        expect(create(:wine)).to be_a(Wine)
      end

      it "should have attributes" do
        wine = create(:wine)
        expect(wine.name).to be_a(String)
        expect(wine.varietal).to be_a(String)
        expect(wine.vintage).to be_a(String)
        expect(wine.vineyard).to be_a(String)
        expect(wine.rating).to be_a(Integer)
        expect(wine.description).to be_a(String)
      end
    end
  end
end
