class Host < ActiveRecord::Base
  has_many :checks
	validates_presence_of :name,:address

	def self.check_all
		Host.find(:all).each do |h|
			h.checks.each do |c|				
				c.update_attribute(:status , c.script.check(h.address))
			end
		end
	end

end