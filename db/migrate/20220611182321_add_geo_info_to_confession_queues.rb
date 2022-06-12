class AddGeoInfoToConfessionQueues < ActiveRecord::Migration[6.1]
  def change
    add_column :confession_queues, :city, :string, null: false, default: ''
    add_column :confession_queues, :state, :string, null: false, default: ''
    add_column :confession_queues, :street, :string, null: false, default: ''
    add_column :confession_queues, :postcode, :string, null: false, default: ''
    add_column :confession_queues, :latitude, :float
    add_column :confession_queues, :longitude, :float
  end
end
