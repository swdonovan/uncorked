class Users::ReviewsController < ApplicationController
  def new
    @review = Review.new
    # params["reviewable_type"] = params["reviewable_type"].chomp('s')
  end

  def create
    if params["review"]["reviewable_type"] == "wines"
      wine = Wine.find(params["review"]["reviewable_id"])
      review = wine.reviews.create(review_params)
    else
      venue  = Venue.find(params["review"]["reviewable_id"])
      review = venue.reviews.create(review_params)
    end
    if review.save
      flash[:success] = "Review successfully submitted!"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:description, :rating, :user_id, :reviewable_id, :reviewable_type)
    end
end
