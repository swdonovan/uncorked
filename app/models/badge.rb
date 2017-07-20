class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badge

  validates_presence_of :name
  validates_presence_of :description
  validates_uniqueness_of :name
  validates_uniqueness_of :description

  def self.badge_allocation(user)
    if user.reviews.count == 10
      star_performer = Badge.where(name: "All Star Performer")
      user.badges << star_performer
    end
  end
end
