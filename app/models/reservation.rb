class Reservation < ApplicationRecord
  belongs_to :feast
  belongs_to :user
  validates :status, length: { minimum: 1 }

end