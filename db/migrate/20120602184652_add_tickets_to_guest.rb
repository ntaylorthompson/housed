class AddTicketsToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :tickets, :integer
  end
end
