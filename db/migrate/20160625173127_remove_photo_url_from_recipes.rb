class RemovePhotoUrlFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :photo_url, :string
  end
end
