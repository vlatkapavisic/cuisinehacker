class AddPhotoUrlToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :photo_url, :string
  end
end
