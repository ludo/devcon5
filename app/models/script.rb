class Script < ActiveRecord::Base
  has_many :hosts

	def self.scripts
		files = Dir.glob("#{RAILS_ROOT}/lib/scripts/*_script.rb")
		files.map!{|s| s.split("/").last.gsub("_script.rb","")}
	end

end