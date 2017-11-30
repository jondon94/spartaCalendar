class AddColourColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :room_colour, :string
  end
end
