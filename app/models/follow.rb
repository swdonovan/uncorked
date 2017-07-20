class Follow < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :user

  def target_feed_name
    target_type.downcase
  end

  def report_follow
    attrs = {
      user_id: user_id,
      target_type: target_type,
      target_id: target_id,
      target_feed: target_feed_name
    }
    Feed.new(attrs).follow
  end

  def report_unfollow
    attrs = {
      user_id: user_id,
      target_type: target_type,
      target_id: target_id,
      target_feed: target_feed_name
    }
    Feed.new(attrs).unfollow
  end
end
