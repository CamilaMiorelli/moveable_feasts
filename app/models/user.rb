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
  validates :first_name, length: { minimum: 1 }
  validates :last_name, length: { minimum: 1 }
  validates :bio, length: { minimum: 20 }
  validates :gender, length: { minimum: 1 }
  has_one_attached :photo
end
