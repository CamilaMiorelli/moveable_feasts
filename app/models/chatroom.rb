class Chatroom < ApplicationRecord
  belongs_to :feast
  has_many :messages
end
