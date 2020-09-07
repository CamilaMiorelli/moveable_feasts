class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :feasts
  has_many :reservations
  has_many :events, through: :reservations, source: :feast, class_name: "Feast"
  has_many :reviews
  has_many :messages
  validates :first_name, length: { minimum: 1 }
  validates :last_name, length: { minimum: 1 }
  validates :bio, length: { minimum: 20 }
  validates :gender, length: { minimum: 1 }
  has_one_attached :photo
  has_many :incoming_reservations, through: :feasts, source: :reservations, class_name: "Reservation"

  def all_feasts
    # events.or(feasts)
    feasts_array = [] 
    # grab feasts where user is organizer
    feasts_array << feasts
    # grab feasts where user is organizer
    reservations.each do |reservation|
      feasts_array << reservation.feast
    end
    return feasts_array
  end

  def host?(feast)
    feast.user == self
  end

  def guest?(feast)
    reservation = Reservation.find_by(feast_id: feast.id, user_id: self.id)
    if reservation.present?
      reservation.status == "Accepted"
    else
      false
    end
  end
  
  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

end
