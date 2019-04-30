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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_30_163046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "descriptions", force: :cascade do |t|
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "profile_image_id"
    t.text "description", null: false
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.string "hosted_by"
    t.string "dj"
    t.string "drink_specials"
    t.string "cover_charge", default: "No Cover"
    t.string "event_type"
    t.string "event_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_albums", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "album_image_id"
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "photo_album_id"
    t.string "title", default: "Photo", null: false
    t.string "photo_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_album_id"], name: "index_photos_on_photo_album_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "staff_image_id"
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
