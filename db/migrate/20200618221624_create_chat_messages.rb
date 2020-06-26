class CreateChatMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_messages do |t|
      t.integer :chat_id
      t.integer :message_id
    end
  end
end
