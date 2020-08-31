class AddFeastToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :feast, null: false, foreign_key: true
  end
end
