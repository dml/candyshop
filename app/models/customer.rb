class Customer < ActiveRecord::Base
  has_many :participations
  validates :name, :presence => true
end
