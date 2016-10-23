class RemoveCategoryModel < ActiveRecord::Migration
  def change
    remove_column :recipes, :category_id, :integer
    drop_table :categories
  end
end
