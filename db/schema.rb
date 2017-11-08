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

ActiveRecord::Schema.define(version: 20171108165535) do

  create_table "fields", force: :cascade do |t|
    t.integer  "schema_id"
    t.string   "name"
    t.string   "type"
    t.boolean  "selected"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_fields_on_name", unique: true
    t.index ["schema_id"], name: "index_fields_on_schema_id"
  end

  create_table "queries", force: :cascade do |t|
    t.text     "json"
    t.string   "name"
    t.string   "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "queries_schemas", id: false, force: :cascade do |t|
    t.integer "query_id"
    t.integer "schema_id"
    t.index ["query_id"], name: "index_queries_schemas_on_query_id"
    t.index ["schema_id"], name: "index_queries_schemas_on_schema_id"
  end

  create_table "reportlines", force: :cascade do |t|
    t.string   "docID"
    t.integer  "relevancy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reportlines_reports", id: false, force: :cascade do |t|
    t.integer "report_id"
    t.integer "reportline_id"
    t.index ["report_id"], name: "index_reportlines_reports_on_report_id"
    t.index ["reportline_id"], name: "index_reportlines_reports_on_reportline_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "queryId"
    t.string   "queryParam"
    t.decimal  "dcg"
    t.decimal  "ndcg"
    t.decimal  "idcg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schemas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_schemas_on_name", unique: true
  end

end
