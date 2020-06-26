class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :name
      t.integer :admin_participant_id
    end
  end
end
