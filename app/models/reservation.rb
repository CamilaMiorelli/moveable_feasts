class Reservation < ApplicationRecord
  belongs_to :feast
  belongs_to :user
<<<<<<< HEAD
  validates :status, presence: true

end
=======
  validates :status, length: { minimum: 1 }

end
>>>>>>> master
