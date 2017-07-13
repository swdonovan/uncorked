class VenuesController < ApplicationController

  before_action :set_venue, only: [:show]

  def index
    @venues = Venue.paginate(:page => params[:page], :per_page => 30)
  end

  def show
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end
end
