
require 'net/ssh'
class	LoadaverageScript < CheckScript
	
	def execute	
	  begin 	
      	 output = nil	
      	 Net::SSH.start(address, "root") do |ssh|
      		  output = ssh.exec!("uptime")      
         end
         avg = "90000"
         avg = output.match(/.*:\s(.*)/)[1] if output                           
         values = avg.gsub(",","").split(/\s/)
         values.each do |v|
           return "critical" if v.to_i >= @boundary_critical.to_i
           return "warning" if v.to_i >= @boundary_warning.to_i
         end
         return "normal"
         
   
  rescue  Exception => e
    puts "Exception while trying to get Load on host #{address} #{e.insect}"    
    return "critical"
    
  end

	end
end
