class Recipe < ActiveRecord::Base
  include HasSluggedTitle
  mount_uploader :image, ImageUploader

  enum category: [ :breakfast, :lunch_dinner, :other ]

  scope :original, -> { where(recipe_url: '') }

  def original?
    self.recipe_url.blank?
  end

  def category_pretty_name
    lunch_dinner? ? 'Lunch/dinner' : category.capitalize
  end
end
