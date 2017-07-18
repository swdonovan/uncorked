class VenueWine < ApplicationRecord
  belongs_to :wine
  belongs_to :venue

  include StreamRails::Activity
  as_activity

  def activity_actor
    self.venue
  end

  def activity_object
    self.wine
  end
end
