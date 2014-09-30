class TaggingsController < ApplicationController
  def create
  end

  def index
  end

  def show
    # @images = Images.
    # fail
  end
  
  private
  def tagging_params
    params.require(:taggings).permit(:id)
  end
end
