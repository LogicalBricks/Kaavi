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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120804184940) do

  create_table "palabras", :force => true do |t|
    t.string   "palabra"
    t.string   "lugar"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "palabras_traducciones", :id => false, :force => true do |t|
    t.integer "palabra_id"
    t.integer "traduccion_id"
  end

  create_table "significados", :force => true do |t|
    t.string   "palabra"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "traducciones", :force => true do |t|
    t.integer  "significado_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
