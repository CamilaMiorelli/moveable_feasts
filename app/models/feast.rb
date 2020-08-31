class Feast < ApplicationRecord
  has_many :reservations
  has_one :chatroom
  belongs_to :user
end
