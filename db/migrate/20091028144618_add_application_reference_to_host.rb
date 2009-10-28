class AddApplicationReferenceToHost < ActiveRecord::Migration
  def self.up
    add_column :hosts, :application_id, :integer
  end

  def self.down
    remove_column :hosts, :application_id
  end
end
