class DashboardController < ApplicationController
  layout "dashboard"
  
  def index
    @hosts = Host.all(:order => :name)
  end
end
