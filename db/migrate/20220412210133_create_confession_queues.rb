class CreateConfessionQueues < ActiveRecord::Migration[6.1]
  def change
    create_table :confession_queues do |t|
      t.date :date
      t.datetime :startTime
      t.datetime :endTime
      t.text :notes
      t.string :place

      t.timestamps
    end
  end
end
