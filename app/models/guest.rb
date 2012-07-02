class Guest < ActiveRecord::Base
  attr_accessible :email, :tickets, :payment_id, :interested, :ticket_emails, :tickets_requested
  belongs_to :show
  has_many :payment, dependent: :destroy 
  after_update :update_tickets_sold
  
  def update_tickets_sold
    t = self.show 
    t.tickets_sold = Guest.where(show_id: self.show.id).map.each { |i| i.tickets}.sum
    t.save 
  end
  
end
