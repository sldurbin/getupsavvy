# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121113232109) do

  create_table "comment_ratings", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rated_id"
    t.boolean  "rating"
    t.integer  "picture_comment_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "comment_ratings", ["picture_comment_id"], :name => "index_comment_ratings_on_picture_comment_id"
  add_index "comment_ratings", ["rated_id"], :name => "index_comment_ratings_on_rated_id"
  add_index "comment_ratings", ["rater_id", "rated_id", "picture_comment_id"], :name => "unique_comment_ratings", :unique => true
  add_index "comment_ratings", ["rater_id"], :name => "index_comment_ratings_on_rater_id"

  create_table "picposts", :force => true do |t|
    t.string   "caption"
    t.integer  "user_id"
    t.string   "picture"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "picposts", ["user_id", "created_at"], :name => "index_picposts_on_user_id_and_created_at"

  create_table "picture_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "picpost_id"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "picture_comments", ["picpost_id", "created_at"], :name => "index_picture_comments_on_picpost_id_and_created_at"
  add_index "picture_comments", ["user_id"], :name => "index_picture_comments_on_user_id"

  create_table "picture_ratings", :force => true do |t|
    t.boolean  "rating"
    t.integer  "picpost_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "picture_ratings", ["picpost_id", "created_at"], :name => "index_picture_ratings_on_picpost_id_and_created_at"
  add_index "picture_ratings", ["user_id", "picpost_id"], :name => "index_picture_ratings_on_user_id_and_picpost_id", :unique => true
  add_index "picture_ratings", ["user_id"], :name => "index_picture_ratings_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
