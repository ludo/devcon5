class DashboardController < ApplicationController
  layout "dashboard"
  
  def index
    @hosts = Host.all(:order => :name)
    
    respond_to do |format|
      format.html # index.html.haml
      format.js { render :text => "updated" }
    end
  end
end
