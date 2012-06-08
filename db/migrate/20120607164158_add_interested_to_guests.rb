class AddInterestedToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :interested, :boolean
  end
end
