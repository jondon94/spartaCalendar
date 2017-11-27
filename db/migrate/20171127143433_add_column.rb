class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :features, :text
  end
end
