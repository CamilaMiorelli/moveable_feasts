class Reservation < ApplicationRecord
  belongs_to :feast
  belongs_to :user
end
