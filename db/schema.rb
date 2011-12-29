# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111226011516) do

  create_table "article_comment_replies", :force => true do |t|
    t.integer  "article_comment_id"
    t.text     "content"
    t.integer  "user_id"
    t.boolean  "hide"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_comments", :force => true do |t|
    t.integer  "article_id"
    t.text     "content"
    t.integer  "linked_comment_id"
    t.boolean  "lighted",           :default => false
    t.boolean  "hide",              :default => false
    t.text     "log"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "abstract"
    t.integer  "read_num"
    t.integer  "useful_num"
    t.integer  "star_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "post_time"
    t.integer  "board_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "boards", :force => true do |t|
    t.string   "name"
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "img_file"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "board_id"
  end

  create_table "cities", :force => true do |t|
    t.integer  "province_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitecodes", :force => true do |t|
    t.string   "code"
    t.integer  "create_user_id"
    t.boolean  "status"
    t.datetime "enable_date"
    t.integer  "enable_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kindeditor_images", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_articles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.boolean  "status",      :default => true
    t.datetime "cancel_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.string   "city_name"
    t.integer  "score"
    t.string   "avatar"
    t.string   "level"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmed"
    t.string   "confirm_code"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "self_desc"
    t.string   "signature"
    t.integer  "city_id"
  end

end
