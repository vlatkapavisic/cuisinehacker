class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image, ImageUploader

  enum category: [ :breakfast, :lunch_dinner, :other ]

  scope :original, -> { where(recipe_url: '') }

  update_index('recipes') { self }

  def should_generate_new_friendly_id?
    title_changed?
  end

  def original?
    self.recipe_url.blank?
  end

  def category_pretty_name
    lunch_dinner? ? 'Lunch/dinner' : category.capitalize
  end
end
