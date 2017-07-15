class VenueWinesController < ApplicationController
  def new
    @wine = Wine.find(params[:wine_id])
  end

  def create
    wine = Wine.find(params[:wine_id])
    venues = params[:venue_wines][:venue_ids].select(&:presence)
    wine.venues << wine.venues + venues.map { |id| Venue.find(id) }
    redirect_to wine_path(wine), success: "This wine has been successfully listed on your selected venues."
  end
end
