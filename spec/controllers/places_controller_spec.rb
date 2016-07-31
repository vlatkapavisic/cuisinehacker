require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  fixtures :places, :locations

  describe '#map' do
    before(:each) { get :map }

    it 'renders the map template' do
      expect(response).to render_template('map')
    end

    it 'assigns @posts' do
      expect(assigns(:places)).not_to be_empty
    end
  end

  describe '#show' do
    before(:each) { get :show, params: { id: 'season' } }

    it 'renders the show template' do
      expect(response).to render_template('show')
    end

    it 'displays a list of recipes' do
      expect(assigns(:place)).not_to be_nil
    end
  end
end
