require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  fixtures :categories

  describe '#show' do
    before(:each) { get :show, id: 'breakfast' }

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'displays a list of recipes' do
      expect(assigns(:recipes).length).to be > 0
    end
  end
end

