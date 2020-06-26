class CreatePostInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :post_interests do |t|
      t.integer :post_id
      t.integer :interest_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
