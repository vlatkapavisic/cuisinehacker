class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :search, :category_show]

  def index
    @recipes = Recipe.order(created_at: :desc)
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
    @results = Recipe.where("ingredients LIKE ?", "%#{params[:term].downcase}%") if params[:term].present?
  end

  def category_show
    @recipes = Recipe.send(params[:category].underscore).order(created_at: :desc)
    @category_name = @recipes.first.category_pretty_name
  end

  private

    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description, :ingredients, :algorithm, :recipe_url, :author, :author_url, :category, :image)
    end
end
