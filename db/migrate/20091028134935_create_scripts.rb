class CreateScripts < ActiveRecord::Migration
  def self.up
    create_table :scripts do |t|
      t.string :name
      t.string :filename
      t.string :boundary_normal
      t.string :boundary_warning
      t.string :boundary_critical
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :scripts
  end
end