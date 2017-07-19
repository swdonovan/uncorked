class Review < ApplicationRecord
  validates_presence_of :user_id, :description, :rating, :reviewable_type, :reviewable_id

  belongs_to :user
  belongs_to :reviewable, polymorphic: true
end
