class RemoveAddressFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :address, :string
    remove_column :places, :latitude, :float
    remove_column :places, :longitude, :float
  end
end
