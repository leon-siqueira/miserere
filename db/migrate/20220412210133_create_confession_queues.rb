# frozen_string_literal: true

class CreateConfessionQueues < ActiveRecord::Migration[6.1]
  def change
    create_table :confession_queues do |t|
      t.date :date
      t.datetime :start_time
      t.datetime :end_time
      t.text :notes
      t.string :place

      t.timestamps
    end
  end
end
