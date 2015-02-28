class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :requires_login, :guest?,
    :my_image_url, :page_title
  
  def current_user
    @user = User.find_by_session_token(session[:session_token])
  end
  
  def logged_in?
    !!current_user || guest?
  end
  
  def sign_in(user)
    user.session_token = SecureRandom.urlsafe_base64(16)
    session[:session_token] = user.session_token
    user.save!
  end
  
  def sign_out
    user = current_user
    user.session_token = SecureRandom.urlsafe_base64(16)
    session[:session_token] = nil
    user.save!
  end
  
  def requires_login
    redirect_to new_session_url unless logged_in?
  end
  
  def guest?
    return false if current_user.nil?
    return current_user.guest?
  end
  

  def my_image_url(image, max_height)
    if (image.height < max_height)
      return image.filepicker_url
    else
      return image.filepicker_url + "/convert?h=#{max_height}"
    end
  end
  
  def page_title(title)
    @page_title = title
  end
  
end
