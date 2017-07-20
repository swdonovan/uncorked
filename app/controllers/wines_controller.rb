class WinesController < ApplicationController

  before_action :set_wine, only: [:show]

  def index
    if params[:search].present?
      @wines = Wine.text_search(params[:search]).paginate(:page => params[:page], :per_page => 30)
      # @posts = Post.text_search(params[:q])
    else
      @wines = Wine.all.paginate(:page => params[:page], :per_page => 30)
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
