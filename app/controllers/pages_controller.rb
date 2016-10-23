class PagesController < ApplicationController
  def home
    @new_content = Place.last(2).reverse + Recipe.last(2).reverse
  end

  def about
  end
end
