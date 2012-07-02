class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  belongs_to :user
  belongs_to :availability
  belongs_to :show
  
  scope :musician, where("user_id IS NOT NULL")
  scope :show, where("show_id IS NOT NULL")
  scope :availability, where("availability_id IS NOT NULL")    
  
#  scope :public_show,  includes(:show).where("location.show.public ", true)
  
end
