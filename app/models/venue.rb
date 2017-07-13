class Venue < ApplicationRecord
  has_many :user_venues
  has_many :managers, through: :user_venues, source_type: "User"
end
