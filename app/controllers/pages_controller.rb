class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end
  
  def explore
    redirect_to pages_welcome_url unless logged_in?
    # @shown_user = User.find_by_id(params[:id])
    @images = Image.all
  end
end
