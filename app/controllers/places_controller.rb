# frozen_string_literal: true

class PlacesController < ApplicationController
  before_action :search_map, only: %i[index]
  before_action :load_places, only: %i[index]
  before_action :set_place, only: %i[show edit update destroy]

  def index; end

  def show; end

  def new
    @place = Place.new
  end

  def edit; end

  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to place_url(@place), notice: 'Place was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @place.update(place_params)
      redirect_to place_url(@place), notice: 'Place was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @place.destroy
      redirect_to places_url, notice: 'Place was successfully destroyed.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  def search; end

  private

  def load_places
    @places ||= Place.all
  end

  def search_map
    return unless params[:search] && params[:search][:latitude].present? && params[:search][:longitude].present?

    latitude = (params[:search][:latitude].to_d - 1)..(params[:search][:latitude].to_d + 1)
    longitude = (params[:search][:longitude].to_d - 1)..(params[:search][:longitude].to_d + 1)

    @places = Place.where(latitude:, longitude:)
  end

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :latitude, :longitude)
  end
end
