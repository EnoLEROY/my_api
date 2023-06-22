class Listing < ApplicationRecord
  has_many :bookings
  has_many :reservations

  validates :num_rooms, presence: true
end
