require 'test_helper'

class CashflowsControllerTest < ActionController::TestCase
  setup do
    @cashflow = cashflows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cashflows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cashflow" do
    assert_difference('Cashflow.count') do
      post :create, :cashflow => @cashflow.attributes
    end

    assert_redirected_to cashflow_path(assigns(:cashflow))
  end

  test "should show cashflow" do
    get :show, :id => @cashflow.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cashflow.to_param
    assert_response :success
  end

  test "should update cashflow" do
    put :update, :id => @cashflow.to_param, :cashflow => @cashflow.attributes
    assert_redirected_to cashflow_path(assigns(:cashflow))
  end

  test "should destroy cashflow" do
    assert_difference('Cashflow.count', -1) do
      delete :destroy, :id => @cashflow.to_param
    end

    assert_redirected_to cashflows_path
  end
end
