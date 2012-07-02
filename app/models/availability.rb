class Availability < ActiveRecord::Base
  attr_accessible :end, :start, :zip, :travel_radius
  belongs_to :user 
  has_one :location, dependent: :destroy 
  accepts_nested_attributes_for :location
  
end
