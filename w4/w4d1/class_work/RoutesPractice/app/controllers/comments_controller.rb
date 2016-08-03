class CommentsController < ApplicationController
  def index
    if params.has_key?(:user_id)
      @comments = Comment.all.where(user_id: params[:user_id])
    elsif params.has_key?(:contact_id)
      @comments = Comment.all.where(contact_id: params[:contact_id])
    else
      @comments = Comment.all
    end
    render json: @comments
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render json: @comment
  end


  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment
    else
        render(
          json: @comment.errors.full_messages, status: 422
        )
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])

    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors.full_messages
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])

    if @comment.destroy
      render json: @comment
    else
      render json: @comment.errors.full_messages
    end
  end


  private
  def comment_params
    params[:commentable_type][:commentable_id][:comment].permit(:body)
  end

end
