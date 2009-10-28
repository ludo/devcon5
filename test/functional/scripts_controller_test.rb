require 'test_helper'

class ScriptsControllerTest < ActionController::TestCase
  
  test 'create' do
    Script.any_instance.expects(:save).returns(true)
    @script = scripts(:basic)
    post :create, :script => @script.attributes
    assert_response :redirect
  end
  
  test 'create with failure' do
    Script.any_instance.expects(:save).returns(false)
    @script = scripts(:basic)
    post :create, :script => @script.attributes
    assert_template 'new'
  end
  
  test 'update' do
    Script.any_instance.expects(:save).returns(true)
    @script = scripts(:basic)
    put :update, :id => scripts(:basic).to_param, :script => @script.attributes
    assert_response :redirect
  end
  
  test 'update with failure' do
    Script.any_instance.expects(:save).returns(false)
    @script = scripts(:basic)
    put :update, :id => scripts(:basic).to_param, :script => @script.attributes
    assert_template 'edit'
  end
  
  test 'destroy' do
    Script.any_instance.expects(:destroy).returns(true)
    @script = scripts(:basic)
    delete :destroy, :id => @script.to_param
    assert_not_nil flash[:notice] 
    assert_response :redirect
  end
  
  # Not possible: destroy with failure
  
  test 'new' do
    get :new
    assert_response :success
  end
  
  test 'edit' do
    @script = scripts(:basic)
    get :edit, :id => @script.to_param
    assert_response :success
  end
  
  test 'show' do
    @script = scripts(:basic)
    get :show, :id => @script.to_param
    assert_response :success
  end
  
  test 'index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:scripts)
  end
  
end