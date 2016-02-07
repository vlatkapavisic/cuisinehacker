class Recipe < ActiveRecord::Base
  extend FriendlyId
  belongs_to :category
  friendly_id :title, use: :slugged
  scope :original, -> { where(recipe_url: '') }

  def should_generate_new_friendly_id?
    title_changed?
  end

  def original?
    self.recipe_url.blank?
  end
end
