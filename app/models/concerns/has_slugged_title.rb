module HasSluggedTitle
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :title, use: :slugged
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
