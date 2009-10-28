
require 'net/ssh'
class	DiskspaceScript < CheckScript
	
	def execute		
	  # will fetch the in use coulmn
		#todo : ssh to server, execute command and return result
		#{}"df -l | cut -c 48-49"		
		usage = "9000"
	#	Net::SSH.start(address, "root") do |ssh|
		  #output = ssh.exec!("df -l | cut -c 48-49")      
  # end
		"critical"
	end
end
	