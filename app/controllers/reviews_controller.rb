class ReviewsController < ApplicationController
  before_action :block, except: :index

  def index
    # binding.pry
    @reviews = Review.includes(:user)
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
    @review = review.update(review_params) if review.user_id == current_user.id
    redirect_to review_path(@review)
  end

  def show
    @review = Review.find(params[:id])
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
