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

ActiveRecord::Schema.define(:version => 20110319224922) do

  create_table "facilities", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotel_roomtypes", :force => true do |t|
    t.integer  "hotel_id"
    t.integer  "room_type_id"
    t.integer  "no_of_rooms"
    t.integer  "no_of_available"
    t.text     "description"
    t.string   "price"
    t.string   "offer_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hotel_roomtypes", ["hotel_id"], :name => "index_hotel_roomtypes_on_hotel_id"
  add_index "hotel_roomtypes", ["room_type_id"], :name => "index_hotel_roomtypes_on_room_type_id"

  create_table "hotel_types", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotels", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postcode"
    t.string   "phone"
    t.string   "fax"
    t.string   "star"
    t.string   "no_of_rooms"
    t.text     "overview"
    t.text     "terms"
    t.text     "direction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hotel_type_id"
    t.integer  "owner_id"
    t.string   "prices_from"
    t.decimal  "latitude",      :precision => 15, :scale => 10
    t.decimal  "longitude",     :precision => 15, :scale => 10
    t.integer  "location_id"
  end

  create_table "hotels_facilities", :force => true do |t|
    t.integer  "hotel_id"
    t.integer  "facility_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "hotel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uploaded_file_file_name"
    t.string   "uploaded_file_content_type"
    t.integer  "uploaded_file_file_size"
    t.datetime "uploaded_file_updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "hotel_id"
    t.text     "comment"
    t.string   "rating"
    t.boolean  "recommand"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "user_type_id",                        :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
