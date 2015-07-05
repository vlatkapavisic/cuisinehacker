class PagesController < ApplicationController
  def home
  	@new_recipes = Recipe.last(3)
  end

  def about
  end
end
