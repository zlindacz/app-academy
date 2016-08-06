class PostsController < ApplicationController
  before_action :check_for_admin!, only: [:edit, :update]
  before_action :current_user, except: [:show]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @post.errors.full_messages
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :user_id, sub_ids: [])
  end

  def check_for_admin!
    @post = Post.find(params[:id])
    @post.check_for_admin! current_user.id
  end
end
