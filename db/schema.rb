# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_18_221624) do

  create_table "chat_messages", force: :cascade do |t|
    t.integer "chat_id"
    t.integer "message_id"
  end

  create_table "chat_users", force: :cascade do |t|
    t.integer "chat_id"
    t.integer "user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.integer "admin_participant_id"
  end

  create_table "following_users", force: :cascade do |t|
    t.integer "following_id"
    t.integer "follower_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", force: :cascade do |t|
    t.text "name"
    t.text "description"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.text "content"
    t.integer "messageable_id"
    t.string "messageable_type"
    t.datetime "delivered_time"
    t.datetime "read_time"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
  end

  create_table "post_interests", force: :cascade do |t|
    t.integer "post_id"
    t.integer "interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.text "post"
    t.string "url"
    t.text "file"
  end

  create_table "reactions", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.integer "reactionable_id"
    t.string "reactionable_type"
  end

  create_table "user_interests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.text "bio"
    t.string "image_path"
    t.string "facebook_url"
    t.string "instagram_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
