class CreateChatUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_users do |t|
      t.integer :chat_id
      t.integer :user_id
    end
  end
end
