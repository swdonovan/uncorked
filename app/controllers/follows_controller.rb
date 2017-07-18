class FollowsController < ApplicationController

  def create
    case params[:target_type]
    when "Venue"
      target = Venue.find(params[:target_id])
    end

    follow = current_user.follows.new(target: target)
    if follow.save
      StreamRails.client.feed('user', current_user.id).follow(follow.target_feed, follow.target_id)
      # activity_data = { :actor => 'chris', :verb => 'add', :object => 'picture:10', :foreign_id => 'picture:10'
      redirect_to follow.target, success: "#{follow_params[:target_type]} successfully followed!"
    else
      redirect_to follow.target, warning: "There was a problem! #{follow_params[:target_type]} was not followed!"
    end
  end

  def destroy
    follow = Follow.find(params[:id])
    session[:return_to] ||= request.referer
    if follow.user_id == current_user.id
      StreamRails.client.feed('user', current_user.id).unfollow(follow.target_feed, follow.target_id)
      follow.destroy
      redirect_to session.delete(:return_to), success: "#{follow.target.class} successfully unfollowed!"
    else
      redirect_to session.delete(:return_to), warning: "You do not have permission to do this."
    end
  end

  private
    def follow_params
      params.permit(:user_id, :target_id, :target_type)
    end
end
