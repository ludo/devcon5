class Customer < ActiveRecord::Base
  has_many :applications
  
  validates_presence_of :name, :email
end