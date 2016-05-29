require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe '#show' do
    before(:each) do
      get :show, id: 'patisseries-favoris'
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'displays the post title and content' do
      expect(assigns(:post).title).to eq('Patisseries favoris')
      expect(assigns(:post).content).to eq('This essay is an overview of my favourite Parisan patisseries. (...)')
    end
  end

end
