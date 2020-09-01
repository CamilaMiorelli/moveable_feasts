class Review < ApplicationRecord
  belongs_to :user
  validates :review_title, presence: true
  validates :rating, inclusion: 1..10
  validates :review_description, presence: true
end