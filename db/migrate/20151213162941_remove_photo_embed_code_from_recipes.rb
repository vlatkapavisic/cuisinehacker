class RemovePhotoEmbedCodeFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :photo_embed_code, :text
  end
end
