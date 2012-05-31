class AddShowIdToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :show_id, :integer
  end
end
