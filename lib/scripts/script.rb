require 'net/ssh'
class	Script	
	attr_reader :address
	
	def initialize(address)
		@address
	end	
	
	def execute
		raise "overwrite!"
	end
	
end