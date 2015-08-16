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

ActiveRecord::Schema.define(version: 20150816052029) do

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "question_set_id", limit: 4
    t.integer  "q1_ans",          limit: 4
    t.integer  "q2_ans",          limit: 4
    t.integer  "q3_ans",          limit: 4
    t.integer  "q4_ans",          limit: 4
    t.integer  "q5_ans",          limit: 4
    t.integer  "q6_ans",          limit: 4
    t.integer  "q7_ans",          limit: 4
    t.integer  "q8_ans",          limit: 4
    t.integer  "q9_ans",          limit: 4
    t.integer  "q10_ans",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "type",       limit: 4,     null: false
    t.string   "name",       limit: 255,   null: false
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "manifest_category_relations", force: :cascade do |t|
    t.integer  "manifest_id", limit: 4, null: false
    t.integer  "category_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "manifests", force: :cascade do |t|
    t.string   "title",      limit: 255,   null: false
    t.text     "content",    limit: 65535, null: false
    t.integer  "importance", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "policy_points", force: :cascade do |t|
    t.integer  "question_id",        limit: 4
    t.integer  "political_party_id", limit: 4
    t.float    "point",              limit: 24
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "political_parties", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "detail",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "question_sets", force: :cascade do |t|
    t.integer  "q1_id",      limit: 4
    t.integer  "q2_id",      limit: 4
    t.integer  "q3_id",      limit: 4
    t.integer  "q4_id",      limit: 4
    t.integer  "q5_id",      limit: 4
    t.integer  "q6_id",      limit: 4
    t.integer  "q7_id",      limit: 4
    t.integer  "q8_id",      limit: 4
    t.integer  "q9_id",      limit: 4
    t.integer  "q10_id",     limit: 4
    t.boolean  "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.text     "note",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,     null: false
    t.integer  "manifest_id", limit: 4,     null: false
    t.text     "comment",     limit: 65535
    t.boolean  "point",                     null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
