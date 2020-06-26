class CreateUsersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :username
      t.text :bio
      t.string :image_path
      t.string :facebook_url
      t.string :instagram_url
      t.timestamps
    end
  end
end
