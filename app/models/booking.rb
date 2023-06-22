class Booking < ApplicationRecord
  belongs_to :listing, dependent: :destroy
end
