class Review < ApplicationRecord

  acts_as_taggable

  # 非公開状態を０とし、公開状態を１とする
  enum status:{nonreleased: 0, released: 1}

  # reviewが削除されたらそれに紐づくreview_tagも削除される
  has_many :tags
  # has_many :review_tags, dependent: :destroy
  # has_many :tags, through: :review_tags

  # has_many :tags, class_name: "Tag", foreign_key: :tag_id
  has_many :comments
  belongs_to :user, class_name: "User"

  has_many :likes
  # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できるようになります。
  has_many :liked_users, through: :likes, source: :user

  def save_categories(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      review_tag = Tag.find_or_create_by(name:new_name)
      self.tags << review_tag
    end
  end
end
