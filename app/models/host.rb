class Host < ActiveRecord::Base
  # === Associations
  belongs_to :application
  has_many :checks
  
  # === Validations
  validates_presence_of :name,:address
end