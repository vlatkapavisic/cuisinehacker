class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :search, :category_show]

  def index
    @recipes = Recipe.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path, notice: 'Recipe was successfully edited.'
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  def search
    @results = Recipe.where('ingredients LIKE ?', '%#{params[:term].downcase}%') if params[:term].present?
  end

  def category_show
    if Recipe.categories.keys.include? params[:category].underscore
      @recipes = Recipe.send(params[:category].underscore).order(created_at: :desc)
      @page_title = @recipes.first.category_pretty_name + ' recipes'
    end
  end

  private

    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description, :ingredients, :algorithm, :recipe_url, :author, :author_url, :category, :image)
    end
end
