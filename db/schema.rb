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

ActiveRecord::Schema.define(:version => 20130403131735) do

  create_table "emails", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "emails", ["user_id"], :name => "index_emails_on_user_id"

  create_table "photos", :force => true do |t|
    t.integer  "story_id"
    t.integer  "user_id"
    t.string   "image"
    t.integer  "position",    :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "width"
    t.integer  "height"
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.boolean  "for_sale",    :default => false
  end

  add_index "photos", ["for_sale"], :name => "index_photos_on_for_sale"
  add_index "photos", ["permalink"], :name => "index_photos_on_permalink"
  add_index "photos", ["story_id"], :name => "index_photos_on_story_id"
  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "stories", :force => true do |t|
    t.text     "description"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "position",    :default => 0
    t.boolean  "is_private",  :default => false
    t.string   "permalink"
  end

  add_index "stories", ["is_private", "user_id"], :name => "index_stories_on_is_private_and_user_id"
  add_index "stories", ["permalink"], :name => "index_stories_on_permalink"
  add_index "stories", ["title"], :name => "index_stories_on_title"
  add_index "stories", ["user_id"], :name => "index_stories_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "urls", :force => true do |t|
    t.string  "url"
    t.string  "name"
    t.integer "user_id"
  end

  add_index "urls", ["user_id"], :name => "index_urls_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.text     "description"
    t.string   "facebook_url"
    t.string   "specific_url"
    t.string   "permalink"
    t.string   "twitter_url"
    t.string   "blog_url"
    t.string   "internal_url"
    t.string   "google_tracking_id"
    t.string   "avatar"
    t.boolean  "allow_sale",             :default => false
    t.string   "main_photo"
    t.integer  "main_photo_width"
    t.integer  "main_photo_height"
    t.text     "contact"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["internal_url"], :name => "index_users_on_internal_url"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["permalink"], :name => "index_users_on_permalink"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["specific_url"], :name => "index_users_on_specific_url"

end
