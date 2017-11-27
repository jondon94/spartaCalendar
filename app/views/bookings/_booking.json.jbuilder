json.extract! booking, :id, :start_time, :finish_time, :description, :created_at, :updated_at
json.url booking_url(booking, format: :json)
