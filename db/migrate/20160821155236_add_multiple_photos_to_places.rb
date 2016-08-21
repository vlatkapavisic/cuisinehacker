class AddMultiplePhotosToPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :image, :string
    add_column :places, :images, :json
  end
end
