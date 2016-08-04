class Recipe < ActiveRecord::Base
  include HasSluggedTitle
  mount_uploader :image, ImageUploader

  belongs_to :category
  scope :original, -> { where(recipe_url: '') }

  def original?
    self.recipe_url.blank?
  end
end
