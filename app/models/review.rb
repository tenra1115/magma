class Review < ApplicationRecord
  has_many :tags, class_name: "Tag", foreign_key: :tag_id
  has_many :comments
  belongs_to :user, class_name: "User"

  has_many :likes
  # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できるようになります。
  has_many :liked_users, through: :likes, source: :user
end
