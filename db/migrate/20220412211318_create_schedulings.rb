class CreateSchedulings < ActiveRecord::Migration[6.1]
  def change
    create_table :schedulings do |t|
      t.datetime :hour
      t.references :confession_queue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
