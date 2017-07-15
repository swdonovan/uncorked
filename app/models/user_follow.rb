class UserFollow < ApplicationRecord
  belongs_to :followable, polymorphic: true
  # belongs_to :venue
end
