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

ActiveRecord::Schema.define(version: 20150516210058) do

  create_table "attachments", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "archivo_file_name"
    t.string   "archivo_content_type"
    t.integer  "archivo_file_size"
    t.datetime "archivo_updated_at"
    t.string   "url"
  end

  create_table "propiedads", force: :cascade do |t|
    t.string   "id_correo"
    t.string   "pass_correo"
    t.string   "id_amazon"
    t.string   "secreto_amazon"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "solicituds", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "vendedor_id"
    t.string   "cliente"
    t.integer  "disenador_id"
    t.string   "linea"
    t.string   "tipo"
    t.boolean  "set_tallas"
    t.boolean  "contramuestra"
    t.string   "referencia"
    t.integer  "talla"
    t.boolean  "muestra_tela"
    t.string   "nombre_tela"
    t.boolean  "adjunto"
    t.integer  "cantidad"
    t.string   "especificacion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "estado"
    t.integer  "archivo_id"
    t.string   "tipo_pantalon"
  end

  create_table "telas", force: :cascade do |t|
    t.string   "tipo_tela"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "cedula"
    t.string   "clave"
    t.string   "correo"
    t.string   "tipo_usuario"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
