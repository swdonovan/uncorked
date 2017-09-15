class WinesController < ApplicationController
  def index
    if params[:search].present?
      @wines = Wine.text_search(params[:search]).paginate(:page => params[:page], :per_page => 30)
      # @posts = Post.text_search(params[:q])
    else
      @wines = SnoothWine.return_all
    end
  end

  def show
    @wine = SnoothWine.show_wine(params[:id])
  end
end
