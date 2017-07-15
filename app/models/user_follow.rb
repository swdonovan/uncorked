class UserFollow < ApplicationRecord
  belongs_to :followable, polymorphic: true
  belongs_to :user
end
