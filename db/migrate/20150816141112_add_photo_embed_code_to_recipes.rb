class AddPhotoEmbedCodeToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :photo_embed_code, :text
  end
end
