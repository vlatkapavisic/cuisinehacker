class AddCategoryToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :category, :integer, default: 0
  end
end
