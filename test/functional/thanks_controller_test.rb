require 'test_helper'

class ThanksControllerTest < ActionController::TestCase
  setup do
    @thank = thanks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thanks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thank" do
    assert_difference('Thank.count') do
      post :create, thank: @thank.attributes
    end

    assert_redirected_to thank_path(assigns(:thank))
  end

  test "should show thank" do
    get :show, id: @thank.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thank.to_param
    assert_response :success
  end

  test "should update thank" do
    put :update, id: @thank.to_param, thank: @thank.attributes
    assert_redirected_to thank_path(assigns(:thank))
  end

  test "should destroy thank" do
    assert_difference('Thank.count', -1) do
      delete :destroy, id: @thank.to_param
    end

    assert_redirected_to thanks_path
  end
end
