class AddUsertoFeasts < ActiveRecord::Migration[6.0]
  def change
    add_reference :feasts, :user, null: false, foreign_key: true
  end
end
