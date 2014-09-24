class UsersController < ApplicationController
  def new
    @user = User.new()
  end
  
  def edit
    # form: going from guest to new user
    @user = User.find(params[:id])
  end

  def update
    # going from guest to new user
    @user = User.find(params[:id])
    @user.guest = false
    if @user.update(user_params)
      # success!
      sign_in(@user)
      flash[:notices] = ["Signed in!"]
      redirect_to root_url
    else
      # nope!
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def create
    @user = User.new_guest
    @user.save!
    sign_in(@user)
    flash[:notices] = ["Welcome, new guest!"]
    redirect_to root_url
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password, :guest)
  end
end
