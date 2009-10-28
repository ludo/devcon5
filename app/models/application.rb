class Application < ActiveRecord::Base
  belongs_to :customer
  
  validates_presence_of :name
end