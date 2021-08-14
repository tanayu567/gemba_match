class ChatRoomUser < ActiveRecord::Migration[6.1]
  def change
    drop_table :chat_room_users
  end
end
