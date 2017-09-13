class VenueFeed

  def initialize(attrs)
    @venue_id = attrs[:venue_id]
    @target_type = attrs[:target_type]
    @target_id = attrs[:target_id]
    @target_feed = attrs[:target_feed]
    @venue_feed ||= StreamRails.client.feed('venue', venue_id)
  end

  def review
    report_activity( default_activity_data.merge( verb: 'review' ) )
  end

  private
    attr_reader :venue_feed,
                :venue_id,
                :target_type,
                :target_id,
                :target_feed,
                :verb

    def report_activity(data)
      venue_feed.add_activity(data)
    end

    def default_activity_data
      {
        actor: "Venue:#{venue_id}",
        object: "#{target_type}:#{target_id}",
        foreign_id: "#{target_type}:#{target_id}",
        time: DateTime.now,
        to: ["#{target_feed}:#{target_id}"]
      }
    end
end
