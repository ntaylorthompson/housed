class AddMaxTravelRadiusToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :max_travel_radius, :integer
  end
end
