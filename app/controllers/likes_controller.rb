class LikesController < ApplicationController
  before_action :set_like

  def create
    @like = current_user.likes.create(review_id: @review.id)
    redirect_to review_path(@review.id)
  end

  def destroy
    @like = current_user.likes.find_by(review_id: @review.id)
    @like.destroy
    redirect_to review_path(@review.id)
  end


  private
  def set_like
    @review = Review.find(params[:review_id])
    @like_id = "#like-link-#{@review.id}"
    # @review = Review.find(params[:id])
    @like = Like.new
  end




end
