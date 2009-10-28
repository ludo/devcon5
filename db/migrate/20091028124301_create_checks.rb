class CreateChecks < ActiveRecord::Migration
  def self.up
    create_table :checks do |t|
      t.string :name
      t.string :status
			t.integer :script_id			
			t.integer :host_id      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :checks
  end
end