class ChangeReferenceOfChatroom < ActiveRecord::Migration[6.0]
  def change
    remove_reference :chatrooms, :message
    add_reference :messages, :chatroom
  end
end
