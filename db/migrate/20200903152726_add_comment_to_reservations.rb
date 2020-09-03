class AddCommentToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :comment, :text
  end
end
