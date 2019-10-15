class User < ApplicationRecord
  has_many :reviews, class_name: "Review",foreign_key: :user_id
  has_many :comments, class_name: "Comment",foreign_key: :user_id
  validates :nickname, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
