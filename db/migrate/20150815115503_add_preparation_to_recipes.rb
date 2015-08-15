class AddPreparationToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :preparation, :text
  end
end
