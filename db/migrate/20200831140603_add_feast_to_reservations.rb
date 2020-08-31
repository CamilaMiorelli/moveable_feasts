class AddFeastToReservations < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :feast, null: false, foreign_key: true
  end
end
