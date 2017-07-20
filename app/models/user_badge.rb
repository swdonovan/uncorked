class UserBadge < ApplicationRecord
  belongs_to :badge
  belongs_to :user

  validates_presence_of :badge_id
  validates_presence_of :user_id
end
