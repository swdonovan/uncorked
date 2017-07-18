class Follow < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :user

  def target_feed
    target_type.downcase
  end

  # include StreamRails::Activity
  # as_activity
  #
  # def activity_object
  #   self.target
  # end
end
