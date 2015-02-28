class PagesController < ApplicationController
  def home
    @page_title = "Home"
  end

  def about
    @page_title = "About"
  end

  def contact
    @page_title = "Contact"
  end
  
  def explore
    redirect_to pages_welcome_url unless logged_in?
    # @shown_user = User.find_by_id(params[:id])
    @images = Image.all
    @page_title = "Explore"
  end
end
