class Admin < ActiveRecord::Base
  attr_accessible :cost_percentage, :max_travel_radius
end
