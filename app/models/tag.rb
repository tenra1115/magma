class Tag < ApplicationRecord
  validates :name,length:{maximum:50}
  has_many :reviews, through: :review_tag
  has_many :review_tag
end
