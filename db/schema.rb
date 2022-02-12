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

ActiveRecord::Schema.define(version: 2022_01_22_023243) do

  create_table "clientes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome", limit: 200, null: false
    t.string "cpf", limit: 14, null: false
    t.string "telefone", limit: 14, null: false
    t.string "email", limit: 30, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotels", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome", limit: 200, null: false
    t.string "telefone", limit: 20, null: false
    t.string "pais", limit: 150, null: false
    t.string "cidade", limit: 150, null: false
    t.string "estado", limit: 150, null: false
    t.string "rua", limit: 200, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quarto_tipos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nome", limit: 50, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "quartos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "hotel_id", null: false
    t.bigint "quarto_tipo_id", null: false
    t.integer "numero", null: false
    t.string "descricao", limit: 300, null: false
    t.integer "capacidade", null: false
    t.decimal "preco", precision: 5, scale: 2, null: false
    t.boolean "reservado", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_quartos_on_hotel_id"
    t.index ["quarto_tipo_id"], name: "index_quartos_on_quarto_tipo_id"
  end

  create_table "reservas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "quarto_id", null: false
    t.datetime "data_reserva", precision: 6, null: false
    t.datetime "check_in", precision: 6, null: false
    t.datetime "check_out", precision: 6, null: false
    t.integer "preco_total", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_reservas_on_cliente_id"
    t.index ["quarto_id"], name: "index_reservas_on_quarto_id"
  end

  add_foreign_key "quartos", "hotels"
  add_foreign_key "quartos", "quarto_tipos"
  add_foreign_key "reservas", "clientes"
  add_foreign_key "reservas", "quartos"
end
