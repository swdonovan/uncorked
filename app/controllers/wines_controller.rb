class WinesController < ApplicationController

  before_action :set_wine, only: [:show]

  def index
    if params[:search].present?
      @wines = Wine.text_search(params[:search]).paginate(:page => params[:page], :per_page => 30)
      # @posts = Post.text_search(params[:q])
    else
      @wines = SnoothWine.return_all
    end
  end

  def show
    @reviewable = @wine
  end

  private
    def set_wine
      @wine = Wine.find(params[:id])
    end
end
