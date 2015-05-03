class AddPhotoUrlToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :photo_url, :string
  end
end
