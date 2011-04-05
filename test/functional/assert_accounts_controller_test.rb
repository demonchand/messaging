require 'test_helper'

class AssertAccountsControllerTest < ActionController::TestCase
  setup do
    @assert_account = assert_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assert_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assert_account" do
    assert_difference('AssertAccount.count') do
      post :create, :assert_account => @assert_account.attributes
    end

    assert_redirected_to assert_account_path(assigns(:assert_account))
  end

  test "should show assert_account" do
    get :show, :id => @assert_account.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @assert_account.to_param
    assert_response :success
  end

  test "should update assert_account" do
    put :update, :id => @assert_account.to_param, :assert_account => @assert_account.attributes
    assert_redirected_to assert_account_path(assigns(:assert_account))
  end

  test "should destroy assert_account" do
    assert_difference('AssertAccount.count', -1) do
      delete :destroy, :id => @assert_account.to_param
    end

    assert_redirected_to assert_accounts_path
  end
end
