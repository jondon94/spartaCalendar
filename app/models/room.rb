class Room < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :room_name, uniqueness: true

end
