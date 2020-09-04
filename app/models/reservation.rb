class Reservation < ApplicationRecord
  belongs_to :feast
  belongs_to :user
  validates :status, presence: true
  
end
