require 'rails_helper'

RSpec.describe Follow, type: :model do
  context 'relationships' do
    it 'belongs to user' do
      venue = create(:venue)
      follow = create(:follow, target_id: venue.id, target_type: venue.class)

      expect(follow).to respond_to(:user)
    end

    it 'belongs to target' do
      venue = create(:venue)
      follow = create(:follow, target_id: venue.id, target_type: venue.class)

      expect(follow).to respond_to(:target)
    end
  end
end
