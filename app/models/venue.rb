class Venue < ApplicationRecord
  has_many :user_venues
  has_many :managers, through: :user_venues, source_type: "User"

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{street_address} #{city}, #{state} #{zip}"
  end
end
