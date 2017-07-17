class UserFollowsController < ApplicationController
  def new
    @user_follow = UserFollow.new
  end

  def create
    binding.pry
    # @follow = Venue.find(params["format"])
    @user_follow.user_id = current_user.id
    @user_follow.followable_type = params["followable"]
    @user_follow.followable_id = params["format"]
    binding.pry
    if @user_follow.save
      redirect_to user_venues_path(current_user), success: "Venue successfully followed!"
    else
      redirect_to venue_path(@follow) #or back to venue#show
    end
  end
end
