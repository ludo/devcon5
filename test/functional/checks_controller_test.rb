require 'test_helper'

class ChecksControllerTest < ActionController::TestCase
  
  test 'create' do
    Check.any_instance.expects(:save).returns(true)
    @check = checks(:basic)
    post :create, :check => @check.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Check.any_instance.expects(:save).returns(false)
    @check = checks(:basic)
    post :create, :check => @check.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Check.any_instance.expects(:save).returns(true)
    @check = checks(:basic)
    put :update, :id => checks(:basic).to_param, :check => @check.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Check.any_instance.expects(:save).returns(false)
    @check = checks(:basic)
    put :update, :id => checks(:basic).to_param, :check => @check.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Check.any_instance.expects(:destroy).returns(true)
    @check = checks(:basic)
    delete :destroy, :id => @check.to_param
    assert_not_nil flash[:notice] 
    assert_response :redirect
  end
  
  # Not possible: destroy with failure
  
  test 'new' do
    get :new
    assert_response :success
  end
  
  test 'edit' do
    @check = checks(:basic)
    get :edit, :id => @check.to_param
    assert_response :success
  end
  
  test 'show' do
    @check = checks(:basic)
    get :show, :id => @check.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:checks)
  end
  
end