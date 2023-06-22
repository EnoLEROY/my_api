class Listing < ApplicationRecord
  has_many :bookings, :reservations

  validates :num_rooms, presence: true
end

