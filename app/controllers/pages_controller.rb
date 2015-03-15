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
    @images = Image.
      paginate(page: params[:page], per_page: 3).
      order(created_at: :desc)
    @page_title = "Explore"
    # for pagination
    respond_to do |format|
      format.html
      format.js
    end
  end
end
