class RemoveNameFromCheck < ActiveRecord::Migration
  def self.up
	remove_column :checks, :name
  end

  def self.down
    add_column :checks, :name, :string
  end
end
