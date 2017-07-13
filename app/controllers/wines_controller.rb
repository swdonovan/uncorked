class WinesController < ApplicationController
  def index
    @wines = Wine.paginate(:page => params[:page], :per_page => 30)
  end
end
