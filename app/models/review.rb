class Review < ApplicationRecord
  has_many :tags, class_name: "Tag", foreign_key: :tag_id
  has_many :comments
  belongs_to :user, class_name: "User"
end
