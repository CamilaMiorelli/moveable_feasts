class ChangeStatusOfReservation < ActiveRecord::Migration[6.0]
  def change
    change_column_default :reservations, :status, from: nil, to: "pending"
  end
end
