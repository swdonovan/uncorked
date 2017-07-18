class FollowsController < ApplicationController

  def create
    @follow = current_user.follows.new(follow_params)
    if @follow.save
      redirect_to @follow.target, success: "#{follow_params[:target_type]} successfully followed!"
    else
      redirect_to @follow.target, warning: "There was a problem! #{follow_params[:target_type]} was not followed!"
    end
  end

  private
    def follow_params
      params.permit(:user_id, :target_id, :target_type)
    end
end
