class AddTravelRadiusToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :travel_radius, :integer
  end
end
