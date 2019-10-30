class UsersController < ApplicationController

  def index
    @users = User.where("nickname LIKE(?)", "%#{params[:man]}%").where.not(id: current_user.id) 
   
  # binding.pry
     
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @review_zero = @reviews.blank?
  end

  def edit
    @user = User.find(params[:id])
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
