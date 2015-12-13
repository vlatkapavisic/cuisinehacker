class RenameColumnPreparationinRecipeToAlgorithm < ActiveRecord::Migration
  def change
  	rename_column :recipes, :preparation, :algorithm
  end
end
