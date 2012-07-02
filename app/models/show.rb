class Show < ActiveRecord::Base
  attr_accessible :date, :host_em, :location, :ticket_price, :tickets_max,
                  :tickets_min, :time, :tickets_sold, :complete, :public
#  belongs_to :host_id, class_name: "User"
  belongs_to :user
  has_many :guests, dependent: :destroy 
  has_one :host, dependent: :destroy 
  has_one :location, dependent: :destroy 
  
  accepts_nested_attributes_for :location  
  
  validates :date, :location, :ticket_price, 
            :tickets_max, :tickets_min, presence: true

#  validates :musician_id, presence: true
end
