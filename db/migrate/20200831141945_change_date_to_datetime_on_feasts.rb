class ChangeDateToDatetimeOnFeasts < ActiveRecord::Migration[6.0]
  def change
    remove_column :feasts, :start_at
    remove_column :feasts, :end_at
    add_column :feasts, :start_at, :datetime
    add_column :feasts, :end_at, :datetime
  end
end
