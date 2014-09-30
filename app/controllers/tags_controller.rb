class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    tagged_images = Tagging.where(tag_id: @tag.id)
    @images = tagged_images.map do |tagged_image|
      Image.find_by_id(tagged_image.image_id)
    end
  end

  def index
  end
end
