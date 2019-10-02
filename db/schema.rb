ActiveRecord::Schema.define(version: 2019_09_25_154111) do

  create_table "characters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chatacter_majors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "character_id"
    t.integer "major_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "majors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "question_id"
    t.integer "option_id"
    t.integer "user_id"
    t.integer "batch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_majors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "major_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation"
    t.string "full_name"
    t.datetime "dob"
    t.string "address"
    t.string "phone"
    t.string "gender"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
