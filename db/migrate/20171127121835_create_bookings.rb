class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :room_id
      t.integer :user_id
      t.text :description
      t.datetime :start_time
      t.datetime :finish_time

      t.timestamps
    end
  end
end
