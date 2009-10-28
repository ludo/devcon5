class Application < ActiveRecord::Base
  # === Associations
  belongs_to :customer
  has_many :hosts
  
  # === Validations
  validates_presence_of :name
  validates_uniqueness_of :name
end