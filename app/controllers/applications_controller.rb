class ApplicationsController < InheritedResources::Base
  belongs_to :customer
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def create
    create! do |format|
      format.html { redirect_to customer_applications_path(@customer) }
    end
  end

  def update
    update! do |format|
      format.html { redirect_to customer_applications_path(@customer) }
    end
  end
  
protected
  
  def collection
    @search = end_of_association_chain.search(params[:search])
    @applications  = @search.paginate(:page => params[:page])
  end

end