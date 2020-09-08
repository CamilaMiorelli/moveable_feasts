class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewer, class_name: 'User'
  validates :reviewer, presence: true
  validates :review_title, presence: true
  validates :rating, inclusion: 1..10
  validates :review_description, presence: true
  
  
end
