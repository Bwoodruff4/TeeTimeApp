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

ActiveRecord::Schema.define(version: 2020_04_13_210626) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
  end

  create_table "golfers", force: :cascade do |t|
    t.string "name"
    
  end

  create_table "teetimes", force: :cascade do |t|
    t.string "reservation_time"
    t.integer "course_id"
    t.integer "golfer_id"
    t.index ["course_id"], name: "index_teetimes_on_course_id"
    t.index ["golfer_id"], name: "index_teetimes_on_golfer_id"
    
  end

  add_foreign_key "teetimes", "courses"
  add_foreign_key "teetimes", "golfers"
end
