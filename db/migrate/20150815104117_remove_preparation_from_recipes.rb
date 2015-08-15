class RemovePreparationFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :preparation, :text
  end
end
