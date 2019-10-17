class ReviewsController < ApplicationController
  before_action :block, except: :index

  def index
    @reviews = Review.includes(:user)
    # binding.pry
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params) && review.user_id == current_user.id
      redirect_to review_path(review)
    else
      render :edit
    end
  end

  def show
    @review = Review.find(params[:id])
    @like = Like.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:text, :title, :ski_field_name, :rate).merge(user_id: current_user.id)
  end

  def block
    if user_signed_in?
      return
    else
      redirect_to new_user_registration_path
    end
  end
end
