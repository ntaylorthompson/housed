class AddDefaultFanTravelRadiusToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :default_fan_travel_radius, :integer
  end
end
