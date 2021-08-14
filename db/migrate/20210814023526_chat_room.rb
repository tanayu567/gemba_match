class ChatRoom < ActiveRecord::Migration[6.1]
  def change
    drop_table :chat_rooms
  end
end
