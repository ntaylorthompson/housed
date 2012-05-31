class Guest < ActiveRecord::Base
  attr_accessible :email
  belongs_to :show
end
