class MissionsController < ApplicationController

  def index
    @missions = Mission.all
    @missions_json = {
      "missions": @missions
    }
    render json: @missions_json
  end
end
