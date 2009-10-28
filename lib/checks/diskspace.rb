
require 'net/ssh'
class	DiskspaceScript < CheckScript
	
	def execute	
	  begin 	
      	 output = ""	
      	 Net::SSH.start(address, "root") do |ssh|
      		  output = ssh.exec!("df -l | cut -c 48-49")      
         end
         usage = "90000"
         usage = output.split("\n").last.to_i unless output.blank?
         return "critical" if usage.to_i >= @boundary_critical.to_i
         return "warning" if usage.to_i >= @boundary_warning.to_i
         return "normal" if usage.to_i < @boundary_normal.to_i                 
   
  rescue  Exception => e
    puts "Exception while trying to get disk usage on host #{address} #{e.insect}"    
    return "critical"
  end

	end
end
	