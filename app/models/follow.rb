class Follow < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :user

  # include StreamRails::Activity
  # as_activity
  #
  # def activity_object
  #   self.target
  # end
end
