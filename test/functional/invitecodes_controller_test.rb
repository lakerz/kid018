require 'test_helper'

class InvitecodesControllerTest < ActionController::TestCase
  setup do
    @invitecode = invitecodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invitecodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invitecode" do
    assert_difference('Invitecode.count') do
      post :create, :invitecode => @invitecode.attributes
    end

    assert_redirected_to invitecode_path(assigns(:invitecode))
  end

  test "should show invitecode" do
    get :show, :id => @invitecode.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @invitecode.to_param
    assert_response :success
  end

  test "should renew_avatar invitecode" do
    put :update, :id => @invitecode.to_param, :invitecode => @invitecode.attributes
    assert_redirected_to invitecode_path(assigns(:invitecode))
  end

  test "should destroy invitecode" do
    assert_difference('Invitecode.count', -1) do
      delete :destroy, :id => @invitecode.to_param
    end

    assert_redirected_to invitecodes_path
  end
end
