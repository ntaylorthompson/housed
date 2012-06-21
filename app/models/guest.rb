class Guest < ActiveRecord::Base
  attr_accessible :email, :tickets, :payment_id, :interested
  belongs_to :show
  has_one :payment
  after_create :update_tickets_sold
  
  def update_tickets_sold
    t = self.show 
    t.tickets_sold += tickets
    t.save 
  end
  
end
