class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :preparation
      t.references :category, index: true

      t.timestamps
    end
  end
end
