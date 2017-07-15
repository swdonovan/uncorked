class UserFollow < ApplicationRecord
  belongs_to :follower, polymorphic: true
  belongs_to :venue
end
