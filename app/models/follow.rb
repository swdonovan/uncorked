class Follow < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :user

  attr_reader :user_feed

  def target_feed_name
    target_type.downcase
  end

  def user_feed
    @user_feed ||= StreamRails.client.feed('user', user_id)
  end

  def report_activity(data)
    user_feed.add_activity(data)
  end

  def report_follow
    user_feed.follow(target_feed_name, target_id)
    report_activity( default_activitiy_data.merge( verb: 'follow' ) )
  end

  def report_unfollow
    user_feed.unfollow(target_feed_name, target_id)
    report_activity( default_activitiy_data.merge( verb: 'unfollow' ) )
  end

  private


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
