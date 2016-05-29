require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe '#show' do
    before(:each) do
      get :show, id: 'chia-pudding'
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'displays the recipe details' do
      expect(assigns(:recipe).title).to eq('Chia pudding')
      expect(assigns(:recipe).description).to eq('Low in calories, high in nutrients!')
    end
  end

end