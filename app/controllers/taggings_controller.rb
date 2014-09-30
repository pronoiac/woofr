class TaggingsController < ApplicationController
  def create
    tag_name = params[:tag][:name]
    image_id = params[:tag][:image_id]
    image_user_id = params[:tag][:image_user_id]
    @tag = Tag.find_by(name: tag_name) || 
      Tag.create!({name: tag_name})
    tagging = Tagging.new ({
      tag_id: @tag.id,
      image_id: image_id
    })
    if tagging.save
      # yay
      flash[:notices] = ["Tag applied!"]
    else
      # nope
      flash[:errors] = tagging.errors.full_messages
      # redirect_to :back
    end
    redirect_to user_image_url(id: image_id, 
      user_id: image_user_id)
    
    # fail
  end

  def index
  end

  def show
    # @images = Images.
    # fail
  end
  
  def destroy
    tagging = Tagging.find(params[:id])
    tagging.destroy!
    redirect_to :back
  end
  
  private
  def tagging_params
    params.require(:taggings).permit(:id)
  end
end
