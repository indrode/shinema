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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130901143528) do

  create_table "movie_lists", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movie_meta", force: true do |t|
    t.integer  "rotten_id"
    t.string   "title"
    t.integer  "year"
    t.string   "poster_url"
    t.string   "rotten_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.integer "user_id"
    t.integer "genre_id"
    t.integer "meta_id"
    t.integer "tomato_id"
    t.string  "title"
    t.integer "rating"
    t.integer "year"
    t.string  "display_title"
  end

  add_index "movies", ["genre_id"], name: "index_movies_on_genre_id", using: :btree
  add_index "movies", ["meta_id"], name: "index_movies_on_meta_id", using: :btree
  add_index "movies", ["tomato_id"], name: "index_movies_on_tomato_id", using: :btree
  add_index "movies", ["user_id"], name: "index_movies_on_user_id", using: :btree

end