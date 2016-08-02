class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
        render(
          json: user.errors.full_messages, status: 422
        )
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  private

  def user_params
    params[:user].permit(:username)
  end
end
