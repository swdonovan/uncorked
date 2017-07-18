class UserVenue < ApplicationRecord
  validates_presence_of :user_id, :venue_id

  belongs_to :manager, polymorphic: true
  belongs_to :venue
end
