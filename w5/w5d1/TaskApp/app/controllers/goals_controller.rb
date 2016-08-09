class GoalsController < ApplicationController
  before_filter :check_ownership, only: [:edit, :update, :destroy]

  def index
    @user_goals = Goal.where(user_id: current_user.id)
    @public_goals = Goal.where(privacy: false).where.not(user_id: current_user.id)
  end

  def show
    @goal = current_user.goals.find_by(id: params[:id])
    if @goal
      render :show
    else
      redirect_to goals_url(@goal)
    end
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = current_user.goals.find(params[:id])
    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @goal.errors.full_messages
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to goals_url
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :completed, :privacy)
  end

  def check_ownership
    @goal = Goal.find(params[:id])
    unless @goal.user == current_user
      redirect_to goal_url(@goal)
    end
  end

end
