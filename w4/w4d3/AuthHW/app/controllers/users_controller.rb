class UsersController < ApplicationController
  before_action :require_current_user!, :require_same_user!, except: [:create, :new]

  def create
    @user = User.new(params[:user])
    if @user.save
      login!(@user)
      reidrect_to user_url(@user)
    else
      render json: @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
