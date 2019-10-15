class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    # @comment = Comment.create(comment: comment_params[:comment], review_id: comment_params[:review_id], user_id: current_user.id)
    # binding.pry
    redirect_to review_path(@comment.review_id) 
  end

  def destroy
    @comment = Comment.find(params[:review_id])
    @comment.destroy if @comment.user_id == current_user.id
    redirect_to root_path
  end

  def edit
    @comment = Comment.find(params[:review_id])
    # y = @review.comments(params[:id])
    # @comment = @review.comments.find(params[:id])
    # binding.pry
  end

  def update
    comment = Comment.find(params[:review_id])
    comment.update(comment_params) if comment.user_id == current_user.id
  end

  private

  def comment_params
    params.permit(:comment).merge(user_id: current_user.id, review_id: params[:review_id])
  end
end
