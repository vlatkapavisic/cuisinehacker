class ChangeIngredientsType < ActiveRecord::Migration
  def change
    change_column :recipes, :ingredients, :string
  end
end
