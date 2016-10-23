desc 'Set locations_count for existing places' do
  task :set_place_locations_count do
    Place.find_each { |place| Place.reset_counters(place.id, :locations) }
  end
end
