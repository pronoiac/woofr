class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # success!
      sign_in(@user)
      flash[:notices] = ["Signed in!"]
      redirect_to "/"
    else
      # nope!
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def update
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
