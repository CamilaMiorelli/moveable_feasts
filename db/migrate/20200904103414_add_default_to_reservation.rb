class AddDefaultToReservation < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :number_of_guests, :integer, default: 1
  end
end
