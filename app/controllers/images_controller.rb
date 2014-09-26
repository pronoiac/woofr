class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    @image.save!
    fail
      
    render :json => @image
  end

  def show
  end

  def new
    @image = Image.new()
  end

  def update
  end
  
  def index
    render :json => Image.all
  end
  
  private
  
  def image_params
    params.require(:image).permit(:title, :description, :filepicker_url)
  end
  
end
