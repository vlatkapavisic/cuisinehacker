class Recipe < ActiveRecord::Base
  include HasSluggedTitle
  belongs_to :category
  scope :original, -> { where(recipe_url: '') }

  def original?
    self.recipe_url.blank?
  end
end
