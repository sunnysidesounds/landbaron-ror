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

ActiveRecord::Schema.define(version: 20150811205807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "investment_questions", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investment_questions_investments", id: false, force: :cascade do |t|
    t.integer "investment_question_id"
    t.integer "investment_id"
  end

  create_table "investments", force: :cascade do |t|
    t.string   "name"
    t.string   "logo_link"
    t.string   "investment_type"
    t.decimal  "raise_amount"
    t.decimal  "minimum_raise_amount"
    t.string   "investment_duration"
    t.string   "video_link"
    t.string   "status"
    t.string   "risk_rating"
    t.text     "key_information"
    t.integer  "photos_link_id"
    t.integer  "principle_bio_id"
    t.string   "investment_minimum"
    t.text     "fee_structure"
    t.text     "note"
    t.integer  "spots_available"
    t.integer  "qa_id"
    t.integer  "legal_documents_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "qa"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "spots_have"
    t.integer  "vote_enabled",         default: 0
    t.string   "address"
  end

  create_table "investments_principle_investors", id: false, force: :cascade do |t|
    t.integer "principle_investor_id"
    t.integer "investment_id"
  end

  add_index "investments_principle_investors", ["investment_id"], name: "index_investments_principle_investors_on_investment_id", using: :btree
  add_index "investments_principle_investors", ["principle_investor_id"], name: "index_investments_principle_investors_on_principle_investor_id", using: :btree

  create_table "media", force: :cascade do |t|
    t.integer  "investment_id"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "media_item_file_name"
    t.string   "media_item_content_type"
    t.integer  "media_item_file_size"
    t.datetime "media_item_updated_at"
  end

  create_table "orders", id: false, force: :cascade do |t|
    t.string   "token"
    t.string   "transaction_id"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "status"
    t.string   "number"
    t.string   "uuid"
    t.string   "user_id"
    t.decimal  "price"
    t.decimal  "shipping"
    t.string   "tracking_number"
    t.string   "phone"
    t.string   "name"
    t.date     "expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payment_option_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "order_id"
    t.string   "category"
    t.integer  "media_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_options", force: :cascade do |t|
    t.decimal  "amount"
    t.string   "amount_display"
    t.text     "description"
    t.string   "shipping_desc"
    t.string   "delivery_desc"
    t.integer  "limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "principle_investors", force: :cascade do |t|
    t.integer  "investment_id"
    t.integer  "user_id"
    t.string   "full_name"
    t.string   "img_url"
    t.text     "bio"
    t.string   "occupation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
  end

  create_table "quotes", force: :cascade do |t|
    t.string   "reference_id"
    t.integer  "investment_id"
    t.integer  "user_id"
    t.decimal  "total_amount"
    t.string   "investor_profile_type"
    t.string   "status"
    t.string   "payment_methd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "income_range"
    t.boolean  "principle_investor"
    t.boolean  "verified"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "",   null: false
    t.boolean  "password_migrated",      default: true
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "country"
    t.string   "property_types"
    t.string   "deal_types"
    t.string   "budget_range"
    t.string   "risk_tolerance"
    t.string   "property_categories"
    t.string   "invested_in_realestate"
    t.string   "hear_about_us"
    t.string   "reason_to_invest"
    t.string   "current_investments"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "investment_id"
    t.integer  "user_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
