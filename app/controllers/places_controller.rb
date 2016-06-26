class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :set_places, only: [:index, :map]
  before_action :authenticate_user!, except: :show

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
  end

  private
    def set_place
      @place = Place.friendly.find(params[:id])
    end

    def set_places
      @places = Place.order(created_at: :desc)
    end

    def place_params
      params.require(:place).permit(:name, :review, :address, :image)
    end
end
