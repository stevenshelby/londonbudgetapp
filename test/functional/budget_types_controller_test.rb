require 'test_helper'

class BudgetTypesControllerTest < ActionController::TestCase
  setup do
    @budget_type = budget_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:budget_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create budget_type" do
    assert_difference('BudgetType.count') do
      post :create, budget_type: @budget_type.attributes
    end

    assert_redirected_to budget_type_path(assigns(:budget_type))
  end

  test "should show budget_type" do
    get :show, id: @budget_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @budget_type.to_param
    assert_response :success
  end

  test "should update budget_type" do
    put :update, id: @budget_type.to_param, budget_type: @budget_type.attributes
    assert_redirected_to budget_type_path(assigns(:budget_type))
  end

  test "should destroy budget_type" do
    assert_difference('BudgetType.count', -1) do
      delete :destroy, id: @budget_type.to_param
    end

    assert_redirected_to budget_types_path
  end
end
