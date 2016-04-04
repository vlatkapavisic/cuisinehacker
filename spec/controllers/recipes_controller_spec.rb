require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "#show" do
    it "renders the show template" do
      get :show, id: 1
      expect(response).to render_template("show")
    end
  end

end