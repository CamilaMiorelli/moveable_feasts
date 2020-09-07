class AddStripeToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :state, :string
    add_monetize :reservations, :amount
    add_column :reservations, :checkout_session_id, :string
  end
end
