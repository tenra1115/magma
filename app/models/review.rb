class Review < ApplicationRecord
  # 非公開状態を０とし、公開状態を１とする
  enum status:{nonreleased: 0, released: 1}

  has_many :tags, through: :review_tag
  # reviewが削除されたらそれに紐づくreview_tagも削除される
  has_many :review_tag, dependent: :destroy

  # has_many :tags, class_name: "Tag", foreign_key: :tag_id
  has_many :comments
  belongs_to :user, class_name: "User"

  has_many :likes
  # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できるようになります。
  has_many :liked_users, through: :likes, source: :user
end
