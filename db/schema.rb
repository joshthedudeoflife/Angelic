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

ActiveRecord::Schema.define(version: 20140512001047) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "investment_type"
    t.decimal  "amount_invested"
    t.string   "investment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.decimal  "init_pct_ownership"
    t.integer  "shares_bought"
    t.decimal  "init_share_price"
    t.decimal  "init_post_money"
    t.text     "description"
    t.decimal  "current_shares_outstanding"
    t.decimal  "current_pct_ownership"
    t.decimal  "current_valuation"
    t.decimal  "current_investment_value"
    t.decimal  "unrealized_roi"
    t.decimal  "initial_shares_outstanding"
    t.decimal  "current_share_price"
  end

  add_index "companies", ["deleted_at"], name: "index_companies_on_deleted_at"

  create_table "investment_rounds", force: true do |t|
    t.decimal  "investment_amount"
    t.decimal  "share_price"
    t.decimal  "pre_money_valuation"
    t.text     "investors"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "round_name"
    t.string   "investment_date"
    t.integer  "company_id"
  end

  create_table "scenarios", force: true do |t|
    t.integer  "company_id"
    t.string   "acquirer"
    t.string   "date"
    t.decimal  "exit_valuation"
    t.decimal  "share_price"
    t.decimal  "shares_outstanding"
    t.decimal  "pct_ownership"
    t.decimal  "dilution"
    t.decimal  "cash_returned"
    t.decimal  "cash_profit"
    t.decimal  "net_profit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "exit_roi"
    t.decimal  "amount_invested"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "country"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
