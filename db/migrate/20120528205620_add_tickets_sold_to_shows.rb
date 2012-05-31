class AddTicketsSoldToShows < ActiveRecord::Migration
  def change
    add_column :shows, :tickets_sold, :integer, default: 0
  end
end
