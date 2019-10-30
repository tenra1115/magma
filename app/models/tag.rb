class Tag < ApplicationRecord
  validates :name,length:{maximum:50}
  has_many :review_tags
  has_many :reviews, through: :review_tags
end
