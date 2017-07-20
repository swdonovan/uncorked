class Api::V1::ReviewsController < ActionController::API

  def new
    binding.pry
    @review = Review.new
  end
end
