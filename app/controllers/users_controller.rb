class UsersController < ApplicationController

  def index
    @users = User.where("nickname LIKE(?)", "%#{params[:man]}%").where.not(id: current_user.id) 
   
  # binding.pry
     
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    # binding.pry
    # @reviews = @reviews.where(status: "1")

    
    # if current_user.id == @reviews.user.id
    #   @reviewsss = @reviews.all
    # else 
    #   @reviewsw = @reviews.where(status: "1")
    # end
    # # @reviews_only = @reviews.where(review_id: current_user.id)
    # binding.pry 


    # @reviews.each do |review|
    #   if review.user != current_user && review.status == "nonreleased"
    #     review_block = review
    #   elsif review.status == "released"
    #     review_lock = review
    #   end
    # end
  end

  def edit
    @user = User.find(params[:id])
    # binding.pry
  end

  def update
    user = User.find(params[:id])
    user.update(update_params) if user.id == current_user.id
    redirect_to user_path
  end

  private

  def update_params
    params.require(:user).permit(:nickname, :one_sentense, :skill_list, :interest_list)
  end
end
