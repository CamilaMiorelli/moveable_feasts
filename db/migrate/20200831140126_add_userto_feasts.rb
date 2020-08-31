class AddUsertoFeasts < ActiveRecord::Migration[6.0]
  def change
    add_reference :feasts, :user, foreign_key: true
  end
end
