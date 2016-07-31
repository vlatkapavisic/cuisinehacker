class Location < ApplicationRecord
  belongs_to :place

  geocoded_by :address
  after_validation :geocode
end
