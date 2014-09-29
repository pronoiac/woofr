class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end
  
  def explore
    # @shown_user = User.find_by_id(params[:id])
    @images = Image.all
  end
end
