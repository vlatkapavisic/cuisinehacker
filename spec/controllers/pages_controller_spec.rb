require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  fixtures :recipes, :places

  describe '#home' do
    before(:each) { get :home }

    it 'renders the home template' do
      expect(response).to render_template('home')
    end

    it 'assigns @new_content to the last 2 places and last 2 recipes' do
      expect(assigns(:new_content)).to eq(Place.last(2).reverse + Recipe.last(2).reverse)
    end
  end

  describe '#about' do
    it 'renders the about template' do
      get :about
      expect(response).to render_template('about')
    end
  end
end
