class AddTicketsRequestedToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :tickets_requested, :integer
  end
end
