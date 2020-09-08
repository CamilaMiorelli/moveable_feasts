class Review < ApplicationRecord
  belongs_to :user
  validates :review_title, presence: true
  validates :rating, inclusion: 1..10
  validates :review_description, presence: true

  # def review_full
  #   self.rating
  #   self.review_title
  #   self.review_description
  # end
end
