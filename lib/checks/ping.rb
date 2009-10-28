require 'ping'	
class	PingScript < CheckScript	
	def execute		
		 Ping.pingecho(address, 10) ? "normal" : "critical"		
	end	
end
