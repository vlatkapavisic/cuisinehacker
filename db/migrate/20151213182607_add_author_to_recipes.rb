class AddAuthorToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :author, :string
  end
end
