class DashboardController < ApplicationController
  layout "dashboard"
  
  def index
    @hosts = Host.all(:order => :name)
    
    respond_to do |format|
      format.html # index.html.haml
      format.js { render :template => "dashboard/index.html.haml", :layout => false }
    end
  end
end
