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

ActiveRecord::Schema.define(:version => 20121124155611) do

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
  add_index "comment_ratings", ["rater_id", "picture_comment_id"], :name => "index_comment_ratings_on_rater_id_and_picture_comment_id", :unique => true
  add_index "comment_ratings", ["rater_id"], :name => "index_comment_ratings_on_rater_id"

  create_table "favorites", :force => true do |t|
    t.integer  "user_id"
    t.integer  "picpost_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "favorites", ["picpost_id"], :name => "index_favorites_on_picpost_id"
  add_index "favorites", ["user_id", "picpost_id"], :name => "index_favorites_on_user_id_and_picpost_id", :unique => true
  add_index "favorites", ["user_id"], :name => "index_favorites_on_user_id"

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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
