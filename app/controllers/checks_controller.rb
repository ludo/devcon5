class ChecksController < InheritedResources::Base
  belongs_to :host
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
	def create
		create! do |format|
			format.html { redirect_to  host_path(@host)}
		end
	end
	
	def destroy
		destroy! do |format|
			format.html { redirect_to  host_path(@host)}
		end
	end

  protected
    
    def collection
      @search = end_of_association_chain.search(params[:search])
      @checks  = @search.paginate(:page => params[:page])
    end

        
end