class AddStatusToShowInFeasts < ActiveRecord::Migration[6.0]
  def change
    add_column :feasts, :status, :string, default:"active"
  end
end
