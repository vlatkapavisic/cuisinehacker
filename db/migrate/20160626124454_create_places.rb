class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :review
      t.string :address
      t.string :image
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
