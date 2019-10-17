class LikesController < ApplicationController
  before_action :set_like

  def create
    @like = current_user.likes.create(review_id: params[:review_id])
  end

  def destroy
    # binding.pry
    @like = current_user.likes.find_by(review_id: params[:review_id])
    @like.destroy
  end


  private
  def set_like
    @review = Review.find(params[:review_id])
    @like_id = "#like-link-#{@review.id}"
  end




end
