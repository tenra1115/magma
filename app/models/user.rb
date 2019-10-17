class User < ApplicationRecord
  has_many :reviews, class_name: "Review",foreign_key: :user_id
  has_many :comments, class_name: "Comment",foreign_key: :user_id
  validates :nickname, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        #  親要素が削除されたら子要素も削除される。依存関係
  has_many :likes, dependent: :destroy
  # liked_postsによってuserがどの投稿をいいねしているのかを簡単に取得できるようになります。
  has_many :liked_reviews, through: :likes, source: :review
  # すでにいいねしてあるか判断
  def already_liked?(review)
    self.likes.exists?(review_id: review.id)
  end
end
