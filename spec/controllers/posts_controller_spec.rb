require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  fixtures :posts

  describe '#archive' do
    before(:each) { get :archive }

    it 'renders the index template' do
      expect(response).to render_template('archive')
    end

    it 'assigns @posts' do
      expect(assigns(:posts)).not_to be_empty
    end
  end

  describe '#show' do
    before(:each) { get :show, params: { id: 'patisseries-favoris' } }

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'assigns @post' do
      expect(assigns(:post).title).to eq('Patisseries favoris')
      expect(assigns(:post).content).to eq('This essay is an overview of my favourite Parisan patisseries. (...)')
    end
  end
end

