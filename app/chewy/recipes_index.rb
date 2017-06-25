class RecipesIndex < Chewy::Index
  define_type Recipe do
    field :title, :description, :ingredients, :author
    field :category, value: ->(recipe) { recipe.category }
  end
end
