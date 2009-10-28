class Host < ActiveRecord::Base
  # === Associations
  belongs_to :application
  has_many :checks
  
  # === Validations
  validates_presence_of :name,:address
  
  # === Instance Methods
  
  # Aggregated status for host
  def status
    Check.all(:order => "status").each do |check|
      if check.status == "critical"
        return "critical"
      elsif check.status == "warning"
        return "warning"
      end
    end
    
    return "normal"
  end

  # === Class Methods
  class << self
    def check_all
      Host.find(:all).each do |h|
        h.checks.each do |c|
          c.update_attribute(:status , c.script.check(h.address))
        end
      end
    end
  end
end