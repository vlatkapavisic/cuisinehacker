class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :set_places, only: [:index, :map]
  before_action :authenticate_user!, except: [:show, :map]

  def index
  end

  def show
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.create(place_params)
    if @place.save
      redirect_to places_path, notice: 'Place was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @place.update(place_params)
      redirect_to places_path, notice: 'Place was successfully edited.'
    else
      render 'edit'
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path, notice: 'Place was successfully deleted.'
  end

  def map
    @locations = Location.all
    @markers = Gmaps4rails.build_markers(@locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow "<a href='#{place_url(location.place)}'>#{location.place.name}</a>"
    end
  end

  private
    def set_place
      @place = Place.friendly.find(params[:id])
    end

    def set_places
      @places = Place.order(created_at: :desc)
    end

    def place_params
      params.require(:place).permit(:name, :review, {images: []}, :website, locations_attributes: [:id, :address, :working_hours, :_destroy])
    end
end
