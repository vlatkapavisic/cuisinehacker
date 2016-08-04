class Location < ActiveRecord::Base
  belongs_to :place

  geocoded_by :address
  after_validation :geocode
end
