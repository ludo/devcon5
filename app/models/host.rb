class Host < ActiveRecord::Base
  # === Associations
  belongs_to :application
  has_many :checks
  
  # === Validations
  validates_presence_of :name,:address
  
  # === Instance Methods

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