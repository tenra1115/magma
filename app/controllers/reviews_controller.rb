class ReviewsController < ApplicationController
  before_action :block, except: :index
  before_action :review_block, except: :new
  before_action :gon_get_tags, only: [:edit], except: :new

  def index
    @reviews = Review.where(status: "1")
    @reviews = @reviews.page(params[:page]).per(4).order('created_at DESC')
    # Like.group(:review_id)#まず、記事の番号(review_id)が同じものにグループを分ける
    # order('count(review_id) desc')#それを、番号の多い順に並び替える
    # limit(5)#表示する最大数を3個に指定する
    # pluck(:review_id)#そして最後に:review_idカラムのみを数字で取り出すように指定。
    # Note.find()#最終的に、pluckで取り出される数字をノートのIDとすることでいいね順にreviewを取得する事ができる
    # @ranking = Note.find()#最後に＠all_ranksに代入
    # Arel.sql()SQL インジェクションを防ぐために記述する
    @rankings = Review.find(Like.group(:review_id).order(Arel.sql('count(review_id) desc')).limit(3).pluck(:review_id))

    # スキー場名検索
    @reviews_list = Review.where("ski_field_name LIKE(?)", "%#{params[:view_title]}%")

    # タグ名検索
    @tags = Review.all_tags

    if params[:tag_name]
      @tags_get_reviews = Review.tagged_with("#{params[:tag_name]}")
      # binding.pry
    end
    # -@tag.each do |o|

    # binding.pry
    # if params[:tag_name]
    #   @tasks = @tag.tagged_with("#{params[:tag_name]}")
    # else
    #   return
    # end
    # @tags_list = params[:tag].present? ? Review.tagged_with(params[:tag]) : Review.all
    # @tags_lists = @tags_list.includes(:tags)
    # g = Review.where("tag LIKE(?)", "%#{params[:tag]}%")
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    # redirect_to check_review_path(@review)
    redirect_to root_path
  end

  def edit
    @review = Review.find(params[:id])
    # @tags = @review.tags.map(:name).join(",")
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

  # def dout
  #   @reviews_list = Review.where("ski_field_name LIKE(?)", "%#{params[:view_title]}%")
  # end

  def release
    review =  Review.find(params[:id])
    review.released! unless review.released?
    redirect_to edit_review_path(review), notice: 'この作品を公開しました'
  end

  def nonrelease
    review =  Review.find(params[:id])
    review.nonreleased! unless review.nonreleased?
    redirect_to edit_review_path(review), notice: 'この作品を非公開にしました'
  end

  def check 
    @review = Review.find(params[:id])
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

  def review_block
    @reviews = Review.where(status: "1")
  end

  def gon_get_tags
    @review = Review.find(params[:id])
    gon.t = @review.title
    # gonと言うGEMによりここからJSにデータを遅れる
    gon.get_used_tags = @review.tag_list
    # binding.pry
  end
end
