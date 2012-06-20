class AddZipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :zip, :integer
    add_column :users, :travel_radius, :integer
  end
end
