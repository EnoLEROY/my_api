class Reservation < ApplicationRecord
  belongs_to :listing, dependent: :destroy
end
