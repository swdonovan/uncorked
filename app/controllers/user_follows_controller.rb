class UserFollowsController < ApplicationController
  def new
    @venue = Venue.new
  end

  def create
    @follow = Venue.find(params["format"])
    if @venue.save
      redirect_to user_venues_path(current_user), success: "Venue successfully followed!"
    else
      render new_user_follow_path
    end
  end
end
