require 'test_helper'

class HostsControllerTest < ActionController::TestCase
  
  test 'create' do
    Host.any_instance.expects(:save).returns(true)
    @host = hosts(:basic)
    post :create, :host => @host.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Host.any_instance.expects(:save).returns(false)
    @host = hosts(:basic)
    post :create, :host => @host.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Host.any_instance.expects(:save).returns(true)
    @host = hosts(:basic)
    put :update, :id => hosts(:basic).to_param, :host => @host.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Host.any_instance.expects(:save).returns(false)
    @host = hosts(:basic)
    put :update, :id => hosts(:basic).to_param, :host => @host.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Host.any_instance.expects(:destroy).returns(true)
    @host = hosts(:basic)
    delete :destroy, :id => @host.to_param
    assert_not_nil flash[:notice] 
    assert_response :redirect
  end
  
  # Not possible: destroy with failure
  
  test 'new' do
    get :new
    assert_response :success
  end
  
  test 'edit' do
    @host = hosts(:basic)
    get :edit, :id => @host.to_param
    assert_response :success
  end
  
  test 'show' do
    @host = hosts(:basic)
    get :show, :id => @host.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:hosts)
  end
  
end