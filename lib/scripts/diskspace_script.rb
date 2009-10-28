class	Diskspace_script < Script
	
	
	def execute		
	  # will fetch the in use coulmn
		#todo : ssh to server, execute command and return result
		"df -l | cut -c 48-49"		
	end
end
	