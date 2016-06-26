class Place < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image, ImageUploader
  friendly_id :name, use: :slugged
  geocoded_by :address
  after_validation :geocode

  def should_generate_new_friendly_id?
    name_changed?
  end
end
