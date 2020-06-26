class CreateUserInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :user_interests do |t|
      t.integer :user_id
      t.integer :interest_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
