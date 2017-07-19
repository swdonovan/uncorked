class Follow < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :user

  def target_feed_name
    target_type.downcase
  end

  def report_follow
    user_feed = StreamRails.client.feed('user', user_id)
    user_feed.follow(target_feed_name, target_id)
    activity_data = default_activitiy_data.merge( verb: 'follow' )
    activity_response = user_feed.add_activity(activity_data)
  end

  def report_unfollow
    user_feed = StreamRails.client.feed('user', user_id)
    user_feed.unfollow(target_feed_name, target_id)
    activity_data = default_activitiy_data.merge( verb: 'unfollow' )
    activity_response = user_feed.add_activity(activity_data)
  end

  private
    attr_reader :user_feed

    def default_activitiy_data
      {
        actor: "User:#{user_id}",
        object: "#{target_type}:#{target_id}",
        foreign_id: "#{target_type}:#{target_id}",
        time: DateTime.now,
        to: ["#{target_feed_name}:#{target_id}"]
      }
    end
end
