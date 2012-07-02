class Host < ActiveRecord::Base
  attr_accessible :email
  belongs_to :show
  accepts_nested_attributes_for :show
end
