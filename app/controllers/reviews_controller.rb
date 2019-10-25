class ReviewsController < ApplicationController
  before_action :block, except: :index

  def index
    @reviews = Review.includes(:user).page(params[:page]).per(4).order('created_at DESC')
    # binding.pry
    # Like.group(:review_id)#まず、記事の番号(review_id)が同じものにグループを分ける
    # order('count(review_id) desc')#それを、番号の多い順に並び替える
    # limit(5)#表示する最大数を3個に指定する
    # pluck(:review_id)#そして最後に:review_idカラムのみを数字で取り出すように指定。
    # Note.find()#最終的に、pluckで取り出される数字をノートのIDとすることでいいね順にreviewを取得する事ができる
    # @ranking = Note.find()#最後に＠all_ranksに代入
    # Arel.sql()SQL インジェクションを防ぐために記述する
    @rankings = Review.find(Like.group(:review_id).order(Arel.sql('count(review_id) desc')).limit(3).pluck(:review_id))
    # binding.pry
    # @reviews_kaminari = Review
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

  def dout
    @reviews_list = Review.where("ski_field_name LIKE(?)", "%#{params[:view_title]}%")
    # respond_to do |format|
    #   JSON
    # end
    # binding.pry
  end

  private

  def review_params
    params.require(:review).permit(:text, :title, :ski_field_name, :rate, :tag_list).merge(user_id: current_user.id)
  end

  def block
    if user_signed_in?
      return
    else
      redirect_to new_user_registration_path
    end
  end
end
