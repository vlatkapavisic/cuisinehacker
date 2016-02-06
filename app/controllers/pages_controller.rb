class PagesController < ApplicationController
  def home
    @new_recipes = Recipe.order(created_at: :desc).take(4)
  end

  def about
  end
end
