class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created."
    else
      render "new"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully edited."
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe was successfully deleted."
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients, :preparation, :photo_url)
  end
end
