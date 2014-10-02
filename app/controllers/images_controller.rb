class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    Image.load_metadata(@image)
    @image.save!
    
    # render :json => @image
    redirect_to user_image_path(id: @image.id)
  end

  def show
    @shown_user = User.find_by_id(params[:user_id])
    shown_image_id = params[:id]
    @image = Image.find_by(user_id: @shown_user.id, id: shown_image_id)
    @comments = Comment.where(image_id: shown_image_id)
    @taggings = @image.taggings
  end

  def new
    @image = Image.new()
  end

  def update
  end
  
  def index
    render :json => Image.all
  end
  
  def destroy
    @image = Image.find_by(id: params[:id])
     
    if (@image.poster == current_user)
      # yay!
      @image.destroy!
      flash[:notices] = ["Image removed!"]
      redirect_to user_url(current_user)
    else
      # nope!
      flash[:errors] = ["Not your picture to delete!"]
      redirect_to :back
    end
  end
  
  private
  
  def image_params
    params.require(:image).permit(:title, :description, :filepicker_url)
  end
  
end
