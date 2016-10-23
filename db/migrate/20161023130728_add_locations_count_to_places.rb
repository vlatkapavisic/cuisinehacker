class AddLocationsCountToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :locations_count, :integer, default: 0
  end
end
