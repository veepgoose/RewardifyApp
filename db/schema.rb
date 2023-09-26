ActiveRecord::Schema[7.0].define(version: 2023_09_26_092350) do
  create_table "goals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "wish_id", null: false
    t.date "target_date"
    t.integer "target_days_per_week"
    t.integer "target_hours_per_day"
    t.boolean "achieved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
    t.index ["wish_id"], name: "index_goals_on_wish_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "goals", "users"
  add_foreign_key "goals", "wishes"
  add_foreign_key "wishlists", "users"
end
