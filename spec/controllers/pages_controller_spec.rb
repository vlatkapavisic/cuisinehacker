require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  fixtures :recipes, :categories

  describe '#home' do
    before(:each) { get :home }

    it 'renders the home template' do
      expect(response).to render_template('home')
    end

    it 'assigns @new_recipes to the last 4 recipes' do
      expect(assigns(:new_recipes).length).to eq(4)
    end
  end

  describe '#about' do
    it 'renders the about template' do
      get :about
      expect(response).to render_template('about')
    end
  end
end