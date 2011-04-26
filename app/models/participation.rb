class Participation < ActiveRecord::Base
  belongs_to :customer
  validates :fee, :customer_id, :presence => true
end
