require 'net/ssh'
class	CheckScript	
	attr_reader :address
	
	def initialize(address,boundary_normal,boundary_warning,boundary_critical)		
		@address = address
		@boundary_normal = boundary_normal
		@boundary_warning = boundary_warning
		@boundary_critical = boundary_critical
	end	
	
	
	def execute
		raise "overwrite!"
	end
	
end

Dir.glob(File.join(File.dirname(__FILE__), 'checks/*.rb')).each {|f| require f }
