class AddPhotoEmbedCodeToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :photo_embed_code, :text
  end
end
