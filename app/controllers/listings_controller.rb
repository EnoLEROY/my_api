class ListingsController < ApplicationController
  before_action :set_listing, only: %i[index show]

  def index
    @listings_json = {
      "listings": @listings
    }
    render json: @listings_json
  end

  def show
    @listing = Listing.find(params[:id])
    render json: @listing
  end

  def create
    @listing = Listing.new(params_listing)
    @listing.save
    render json: @listing
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(params_listing)
    render json: @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    set_listing
    render json: @listings
  end

  private

  def set_listing
    @listings = Listing.all
  end

  def params_listing
    params.require(:listing).permit(:num_rooms)
  end
end
