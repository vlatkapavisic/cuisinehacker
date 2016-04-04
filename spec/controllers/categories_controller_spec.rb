require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  before(:each) do
    Category.create(name: "breakfast")
    Recipe.create(category_id: 1, title: "Overnight oats")
  end

  describe "#show" do
    it "renders the show template" do
      get :show, id: "breakfast"
      expect(response).to render_template("show")
    end
  end

end
