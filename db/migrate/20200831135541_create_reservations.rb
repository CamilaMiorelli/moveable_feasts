class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :status
      t.integer :number_of_guests

      t.timestamps
    end
  end
end
