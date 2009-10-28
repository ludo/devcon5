class ApplicationsController < InheritedResources::Base
  belongs_to :customer
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def create
    create! do |format|
      if @application.errors.empty?
        format.html { redirect_to customer_url(@customer) }
      end
    end
  end

  def update
    update! do |format|
      if @application.errors.empty?
        format.html { redirect_to customer_url(@customer) }
      end
    end
  end
  
protected
  
  def collection
    @search = end_of_association_chain.search(params[:search])
    @applications  = @search.paginate(:page => params[:page])
  end

end