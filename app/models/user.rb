class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :feasts
  has_many :events, through: :reservations, source: :reservations, class_name: "Reservation"
  has_many :reservations
  has_many :reviews
  has_many :messages
end
