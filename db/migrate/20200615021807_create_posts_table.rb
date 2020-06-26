class CreatePostsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :content
      t.text :post
      t.string :url
      t.text :file
    end
  end
end
