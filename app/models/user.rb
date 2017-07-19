class User < ApplicationRecord
  has_secure_password

  validates_presence_of :first_name, :last_name, :username, :email, :phone_number, :password
  validates_uniqueness_of :username

  enum role: %w(member manager admin)

  has_many :user_venues, as: :manager
  has_many :venues, through: :user_venues

  has_many :reviews
  has_many :follows
  has_many :followed_venues, :through => :follows, :source => :target, :source_type => 'Venue'

  def manager_has_venues_with_wine?(wine)
    !(venues & wine.venues).empty?
  end

  def followed(target)
    self.follows.where(target: target).first
  end

  def get_follow(target)
    follows.where(target: target)[0]
  end

  def followers
    Follow.where(target: self)
  end

  def news_feed
    enricher = StreamRails::Enrich.new
    feed = StreamRails.feed_manager.get_news_feeds(id)[:flat]
    results = feed.get()['results']
    enricher.enrich_activities(results)
  end

  # include StreamRails::Activity

  # def follow_wine(wine_id)
  #   StreamRails.feed_manager.follow_wine(id, wine_id)
  # end
  #
  # def feed
  #   enricher = StreamRails::Enrich.new
  #   feed = StreamRails.feed_manager.get_news_feeds(id)[:flat]
  #   results = feed.get()['results']
  #   activities = enricher.enrich_activities(results)
  # end

  # def activity_actor
  #   "#{self.first_name} #{self.last_name}"
  # end
  #
  # def activity_object
  #
  # end
  #
  # def follow(id, type)
  #   case type
  #   when "wine"
  #     Wine.find(id)
  #   when "venue"
  #     Venue.find(id)
  #   end
  # end
end
