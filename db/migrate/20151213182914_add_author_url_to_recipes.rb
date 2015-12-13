class AddAuthorUrlToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :author_url, :string
  end
end
