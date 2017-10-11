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

ActiveRecord::Schema.define(version: 20171002152845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cells", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "coordinate_id"
    t.bigint "color_id"
    t.bigint "pip_id"
    t.boolean "occupied", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_cells_on_color_id"
    t.index ["coordinate_id"], name: "index_cells_on_coordinate_id"
    t.index ["pip_id"], name: "index_cells_on_pip_id"
    t.index ["player_id"], name: "index_cells_on_player_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinates", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_dices", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "color_id"
    t.bigint "pip_id"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_game_dices_on_color_id"
    t.index ["game_id"], name: "index_game_dices_on_game_id"
    t.index ["pip_id"], name: "index_game_dices_on_pip_id"
    t.index ["round_id"], name: "index_game_dices_on_round_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighbours", force: :cascade do |t|
    t.bigint "coordinate_id"
    t.integer "neighbour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "direction"
    t.index ["coordinate_id"], name: "index_neighbours_on_coordinate_id"
  end

  create_table "pips", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "user_id"
    t.bigint "color_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_players_on_color_id"
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "game_id"
    t.integer "round_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  create_table "turns", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "round_id"
    t.bigint "game_dice_id"
    t.bigint "cell_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cell_id"], name: "index_turns_on_cell_id"
    t.index ["game_dice_id"], name: "index_turns_on_game_dice_id"
    t.index ["player_id"], name: "index_turns_on_player_id"
    t.index ["round_id"], name: "index_turns_on_round_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cells", "colors"
  add_foreign_key "cells", "coordinates"
  add_foreign_key "cells", "pips"
  add_foreign_key "cells", "players"
  add_foreign_key "game_dices", "colors"
  add_foreign_key "game_dices", "games"
  add_foreign_key "game_dices", "pips"
  add_foreign_key "game_dices", "rounds"
  add_foreign_key "neighbours", "coordinates"
  add_foreign_key "players", "colors"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
  add_foreign_key "rounds", "games"
  add_foreign_key "turns", "cells"
  add_foreign_key "turns", "game_dices"
  add_foreign_key "turns", "players"
  add_foreign_key "turns", "rounds"
end
