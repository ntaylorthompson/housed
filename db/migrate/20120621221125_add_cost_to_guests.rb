class AddCostToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :cost, :float
    add_column :guests, :ticket_emails, :text
  end
end
