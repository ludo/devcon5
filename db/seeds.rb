# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# Setup initial user and make this user an administrator
user = User.create(
  :login => "admin",
  :email => "admin@example.com",
  :password => "password",
  :password_confirmation => "password"
)

Lockdown::System.make_user_administrator(user)

Script.create(:name => "ping", :filename => "ping") unless Script.find_by_name("ping")
Script.create(:name => "diskspace", :filename => "diskspace", :boundary_normal => "70", :boundary_warning => "80", :boundary_critical => "90")  unless Script.find_by_name("diskspace")
Script.create(:name => "loadaverage", :filename => "loadaverage", :boundary_normal => "0.5", :boundary_warning => "2", :boundary_critical => "3")  unless Script.find_by_name("loadaverage")


