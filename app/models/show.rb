class Show < ActiveRecord::Base
  attr_accessible :date, :host_em, :location, :ticket_price, :tickets_max,
                  :tickets_min, :time
#  belongs_to :host_id, class_name: "User"
  belongs_to :user
  has_many :guests
  has_one :host
  
  validates :date, :location, :ticket_price, 
            :tickets_max, :tickets_min, presence: true

#  validates :musician_id, presence: true

  
end
