class Manager::VenuesController < ApplicationController

  def new
    @venue = Venue.new
  end

  def create
    @venue = current_user.venues.create(venue_params)

    if @venue.save
      redirect_to manager_venue_path(@venue), success: "Venue Successfully Created"
    else
      render :new
    end
  end

  private
    def venue_params
      params.require(:venue).permit(:name, :street_address, :city, :state, :zip)
    end

end
