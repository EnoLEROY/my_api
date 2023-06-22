class Reservation < ApplicationRecord
  belongs_to :listing, dependent: :destroy
  after_save :create_mission

  def create_mission
    @listing = Listing.all.find(listing_id)
    @price = 10 * @listing.num_rooms
    @missions = Mission.all
    p 'missions find'
    p @missions.find_by(date: end_date)
    if @missions.find_by(date: end_date).nil?
      @mission_in_out = Mission.new(mission_type: 'checkout_checkin', date: end_date, price: @price, listing_id: @listing[:id])
      @mission_in_out.save
    end
  end
end


# missions
#   type
#     first_checking, start_date de booking
#     last_checkout, end_date de booking
#     checkout_checkin, end_date de reservation SAUF si last_checkout a la meme date !
#   date
#   linsting_id


# a first checkin costs 10€ per room
# - a checkout checkin costs 10€ per room
# - a last checkout costs 5€ per room
