ActiveRecord::Schema.define(version: 20160805015237) do

  create_table "albums", force: :cascade do |t|
    t.string   "album_name",    null: false
    t.string   "recorded_type", null: false
    t.integer  "band_id",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "albums", ["band_id"], name: "index_albums_on_band_id"

  create_table "bands", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "track_type", null: false
    t.text     "lyrics"
    t.integer  "album_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "tracks", ["album_id"], name: "index_tracks_on_album_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["session_token", "email"], name: "index_users_on_session_token_and_email", unique: true

end
