# config/initializers/geocoder.rb
Geocoder.configure(
  # to use an API key:
  api_key: ENV['GMAPS_KEY'],
)