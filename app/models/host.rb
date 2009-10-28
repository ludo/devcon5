class Host < ActiveRecord::Base
  has_many :checks
	validates_presence_of :name,:address
	

end