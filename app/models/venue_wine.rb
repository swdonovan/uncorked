class VenueWine < ApplicationRecord
  validates_presence_of :venue_id, :wine_id

  belongs_to :wine
  belongs_to :venue
end
