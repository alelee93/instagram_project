class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.string :name
      t.integer :user_id
      t.integer :reactionable_id
      t.string :reactionable_type
    end
  end
end
