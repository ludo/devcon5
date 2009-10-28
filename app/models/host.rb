class Host < ActiveRecord::Base
  # === Associations
  belongs_to :application
  has_many :checks
  
  # === Validations
  validates_presence_of :name,:address
  validates_uniqueness_of :name
  validates_uniqueness_of :address
  
  # === Instance Methods
  
  # Aggregated status for host
  def status
    checks.all(:order => "status").each do |check|
      return "critical" if check.status == "critical"
      return "warning" if check.status == "warning"
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