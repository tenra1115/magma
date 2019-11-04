class ReviewTag < ApplicationRecord
  belongs_to :tag

  belongs_to :review
  validates :review_id,presence:true
  validates :tag_id,presence:true
end
