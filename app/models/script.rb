class Script < ActiveRecord::Base
  has_many :hosts

	def self.scripts
		files = Dir.glob("#{RAILS_ROOT}/lib/scripts/*_check.rb")
		files.map!{|s| s.split("/").last.gsub("_check.rb","")}
	end	
	
	def check(address)
		script = "#{filename.capitalize}Script".constantize.new(address,boundary_normal,boundary_warning,boundary_critical)
		script.execute		
	end

end