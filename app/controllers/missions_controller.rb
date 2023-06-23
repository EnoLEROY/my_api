class MissionsController < ApplicationController

  def index
    @missions = Mission.pluck(:listing_id, :mission_type, :date, :price)
      .map { |listing_id, mission_type, date, price|
      { listing_id: listing_id, mission_type: mission_type, date: date, price: price }
    }
    @missions_json = { "missions": @missions }
    render json: @missions_json
  end
end
