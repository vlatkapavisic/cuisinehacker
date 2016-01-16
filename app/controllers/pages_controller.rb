class PagesController < ApplicationController
  def home
    @new_recipes = Recipe.take(4).reverse
  	render layout: 'home_layout'
  end

  def about
  end
end
