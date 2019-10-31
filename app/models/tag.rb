class Tag < ApplicationRecord
  validates :name,length:{maximum:50}
  # belongs_to :saler, class_name: "User"
  has_many :review_tags
  has_many :reviews, through: :review_tags
end
