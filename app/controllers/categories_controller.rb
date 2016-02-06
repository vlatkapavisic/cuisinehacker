class CategoriesController < ApplicationController
	def show
		@category = Category.friendly.find(params[:id])
    @recipes = @category.recipes.order(created_at: :desc)
	end
end