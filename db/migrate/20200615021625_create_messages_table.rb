class CreateMessagesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.text :content
      t.integer :messageable_id
      t.string :messageable_type
      t.datetime :delivered_time
      t.datetime :read_time
    end
  end
end
