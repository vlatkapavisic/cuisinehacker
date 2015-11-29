class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :search]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: "Recipe was successfully created."
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path, notice: "Recipe was successfully edited."
    else
      render "edit"
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Recipe was successfully deleted."
  end

  def search
    @results = Recipe.where("ingredients LIKE ?", "%#{params[:term].downcase}%") if params[:term]
  end

  private

    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description, :ingredients, :preparation, :photo_url, :photo_embed_code, :recipe_url, :category_id)
    end
end
