class Payment < ActiveRecord::Base
  attr_accessible :amount, :transaction_id
  belongs_to :guest
  validates_presence_of :amount
  validates_presence_of :transaction_id


end
