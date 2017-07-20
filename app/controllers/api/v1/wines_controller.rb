class Api::V1::WinesController < ApplicationController

  before_action :all_wines

  def index

  end

  private

  def all_wines
    @wines = Wine.all
  end
end
