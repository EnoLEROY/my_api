class ListingsController < ApplicationController
  before_action :set_listing, only: %i[index show]

  def index
    render json: @listings
  end

  def show
    @listing = Listing.find(params[:id])
    render json: @listing
  end

  def create
    raise
    @listing = Listing.new(params_listing)
    @listing.save
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(params_listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
  end

  private

  def set_listing
    @listings = Listing.all
  end

  def params_listing
    params.require(:listing).permit(:num_rooms)
  end
end
