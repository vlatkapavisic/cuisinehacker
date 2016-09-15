class Place < ActiveRecord::Base
  extend FriendlyId
  mount_uploaders :images, ImageUploader
  friendly_id :name, use: :slugged

  has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations, allow_destroy: true

  def should_generate_new_friendly_id?
    name_changed?
  end
end
