class Tag < ApplicationRecord
  belongs_to :review
  belongs_to :tag, class_name:"Review"
end
