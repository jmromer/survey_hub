# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_05_211011) do
  create_table "questions", force: :cascade do |t|
    t.integer "survey_id", null: false
    t.string "text", null: false
    t.string "description"
    t.integer "responses_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "response_options", force: :cascade do |t|
    t.integer "question_id"
    t.string "value", null: false
    t.string "description"
    t.integer "responses_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_response_options_on_question_id"
    t.index ["value", "question_id"], name: "index_response_options_on_value_and_question_id", unique: true
  end

  create_table "responses", force: :cascade do |t|
    t.integer "response_option_id", null: false
    t.integer "respondent_id", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id", "respondent_id"], name: "index_responses_on_question_id_and_respondent_id", unique: true
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["respondent_id"], name: "index_responses_on_respondent_id"
    t.index ["response_option_id", "respondent_id"], name: "index_responses_on_response_option_id_and_respondent_id", unique: true
    t.index ["response_option_id"], name: "index_responses_on_response_option_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_surveys_on_creator_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "questions", "surveys"
  add_foreign_key "response_options", "questions"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "response_options"
  add_foreign_key "responses", "users", column: "respondent_id"
  add_foreign_key "surveys", "users", column: "creator_id"
end
