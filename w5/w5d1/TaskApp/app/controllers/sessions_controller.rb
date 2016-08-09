class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if @user
      login_user!(@user)
      redirect_to goals_url
    else
      @user = User.new(user_params)
      flash[:errors] = ["User can't be found"]
      render :new
    end
  end

  def destroy
    logout!
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
