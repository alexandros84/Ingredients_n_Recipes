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

ActiveRecord::Schema.define(version: 20170325000957) do

  create_table "_inventories", force: :cascade do |t|
    t.string   "title",      default: "My Recipe"
    t.integer  "herbs",      default: 0
    t.integer  "salt",       default: 0
    t.integer  "pepper",     default: 0
    t.integer  "bananas",    default: 0
    t.integer  "chocolate",  default: 0
    t.integer  "meat",       default: 0
    t.integer  "greens",     default: 0
    t.integer  "olive_oil",  default: 0
    t.integer  "eggs",       default: 0
    t.integer  "butter",     default: 0
    t.integer  "tomatoes",   default: 0
    t.integer  "onions",     default: 0
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["user_id"], name: "index__inventories_on_user_id"
  end

  create_table "drawers", force: :cascade do |t|
    t.string   "title",      default: "My Inventory"
    t.integer  "herbs",      default: 0
    t.integer  "salt",       default: 0
    t.integer  "pepper",     default: 0
    t.integer  "bananas",    default: 0
    t.integer  "chocolate",  default: 0
    t.integer  "meat",       default: 0
    t.integer  "greens",     default: 0
    t.integer  "olive_oil",  default: 0
    t.integer  "eggs",       default: 0
    t.integer  "butter",     default: 0
    t.integer  "tomatoes",   default: 0
    t.integer  "onions",     default: 0
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id"], name: "index_drawers_on_user_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "title",      default: "My Inventory"
    t.integer  "herbs",      default: 0
    t.integer  "salt",       default: 0
    t.integer  "pepper",     default: 0
    t.integer  "bananas",    default: 0
    t.integer  "chocolate",  default: 0
    t.integer  "meat",       default: 0
    t.integer  "greens",     default: 0
    t.integer  "olive_oil",  default: 0
    t.integer  "eggs",       default: 0
    t.integer  "butter",     default: 0
    t.integer  "tomatoes",   default: 0
    t.integer  "onions",     default: 0
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "title",      default: "My Recipe"
    t.integer  "herbs",      default: 0
    t.integer  "salt",       default: 0
    t.integer  "pepper",     default: 0
    t.integer  "bananas",    default: 0
    t.integer  "chocolate",  default: 0
    t.integer  "meat",       default: 0
    t.integer  "greens",     default: 0
    t.integer  "olive_oil",  default: 0
    t.integer  "eggs",       default: 0
    t.integer  "butter",     default: 0
    t.integer  "tomatoes",   default: 0
    t.integer  "onions",     default: 0
    t.integer  "user_id"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.text     "execution",  default: "Throw it all in a cauldron and hope for the best!"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
