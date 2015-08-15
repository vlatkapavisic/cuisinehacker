class AddUrlToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_url, :string
  end
end
