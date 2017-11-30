class Booking < ApplicationRecord
  belongs_to :room
  validates :room_id, :start_time, :finish_time, uniqueness: true

end
