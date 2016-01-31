class PagesController < ApplicationController
  def home
    @new_recipes = Recipe.order('created_at DESC').take(4)
  	render layout: 'home_layout'
  end

  def about
  end
end
