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

ActiveRecord::Schema.define(version: 20171201174148) do

  create_table "eventos", force: :cascade do |t|
    t.string "nombre"
    t.string "lugar"
    t.integer "maxParticipantes"
    t.string "descripcion"
    t.integer "administrador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "fechaInicio"
    t.datetime "fechaFin"
    t.index ["administrador_id"], name: "index_eventos_on_administrador_id"
  end

  create_table "participacions", force: :cascade do |t|
    t.integer "evento_id"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_participacions_on_evento_id"
    t.index ["usuario_id"], name: "index_participacions_on_usuario_id"
  end

  create_table "retroalimentacions", force: :cascade do |t|
    t.string "comentarios"
    t.integer "participante_id"
    t.integer "evento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evento_id"], name: "index_retroalimentacions_on_evento_id"
    t.index ["participante_id"], name: "index_retroalimentacions_on_participante_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email"
    t.string "nombre"
    t.string "apellidos"
    t.string "contrasena"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
