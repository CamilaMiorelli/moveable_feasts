class ChangeStatusToAvailable < ActiveRecord::Migration[6.0]
  def change
    rename_column :feasts, :status, :available
  end
end
