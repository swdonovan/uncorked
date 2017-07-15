class VenueWinesController < ApplicationController

  before_action :set_wine

  def new
  end

  def create
    new_ids = params[:venue_wines][:venue_ids].select(&:presence)
    @wine.venues << @wine.venues + new_ids.map { |id| Venue.find(id) }
    redirect_to wine_path(@wine), success: "This wine has been successfully listed on your selected venues."
  end

  def edit
  end

  def update
    kept_ids = params[:venue_wines][:venue_ids].select(&:presence)
    all_managed_venues = current_user.venues.pluck(:id)
    venues_to_delete = all_managed_venues - kept_ids
    @wine.venue_wines.where(venue_id: venues_to_delete).destroy_all
    # @wines.venues.joins(:venue_wines).where(manager_id:current_user.id) << @THAT + new_ids
    # need to account for user removing some and adding others
    redirect_to wine_path(@wine), success: "The venues with this wine has been successfully updated."
  end

  private
    def set_wine
      @wine = Wine.find(params[:wine_id])
    end
end
