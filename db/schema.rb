# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_611_182_321) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'confession_queues', force: :cascade do |t|
    t.date 'date'
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.text 'notes'
    t.string 'place'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'city', default: '', null: false
    t.string 'state', default: '', null: false
    t.string 'street', default: '', null: false
    t.string 'postcode', default: '', null: false
    t.float 'latitude'
    t.float 'longitude'
  end

  create_table 'schedulings', force: :cascade do |t|
    t.time 'hour'
    t.bigint 'confession_queue_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['confession_queue_id'], name: 'index_schedulings_on_confession_queue_id'
  end

  add_foreign_key 'schedulings', 'confession_queues'
end
