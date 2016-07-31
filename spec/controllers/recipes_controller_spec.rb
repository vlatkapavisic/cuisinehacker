require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  fixtures :all

  describe '#show' do
    before(:each) do
      get :show, params: { id: 'chia-pudding' }
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'displays the recipe details' do
      expect(assigns(:recipe).title).to eq('Chia pudding')
      expect(assigns(:recipe).description).to eq('Low in calories, high in nutrients!')
    end
  end

  describe '#search' do
    context 'navigate to search page' do
      before(:each) { get :search }

      it 'renders the search template' do
        expect(response).to render_template('search')
      end

      it 'has no search results' do
        expect(assigns(:results)).to be_nil
      end
    end

    context 'perform the search' do
      context 'with some results' do
        it 'provides the search results' do
          get :search, params: { term: 'sugar' }
          expect(assigns(:results).length).to eq(2)
        end
      end

      context 'without results' do
        it 'provides no search results' do
          get :search, params: { term: 'white flour' }
          expect(assigns(:results).length).to eq(0)
        end
      end
    end
  end
end
