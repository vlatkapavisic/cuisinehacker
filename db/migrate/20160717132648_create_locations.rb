class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :working_hours
      t.references :place, index: true

      t.timestamps
    end
  end
end
