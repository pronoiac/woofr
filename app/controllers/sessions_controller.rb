class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    debugger
    if @user
      # success!
      sign_in(@user)
      flash[:notices] = ["Signed in!"]
      redirect_to "new_user_url"
    else
      # nope!
      flash.now[:errors] = ["Invalid login!"]
      render :new
    end
  end 
  
  def destroy
    sign_out
    redirect_to "/users/new"
  end
  
end