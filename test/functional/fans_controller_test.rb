require 'test_helper'

class FansControllerTest < ActionController::TestCase
  setup do
    @fan = fans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fan" do
    assert_difference('Fan.count') do
      post :create, fan: { email: @fan.email, fan_interest: @fan.fan_interest, host_interest: @fan.host_interest, name: @fan.name }
    end

    assert_redirected_to fan_path(assigns(:fan))
  end

  test "should show fan" do
    get :show, id: @fan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fan
    assert_response :success
  end

  test "should update fan" do
    put :update, id: @fan, fan: { email: @fan.email, fan_interest: @fan.fan_interest, host_interest: @fan.host_interest, name: @fan.name }
    assert_redirected_to fan_path(assigns(:fan))
  end

  test "should destroy fan" do
    assert_difference('Fan.count', -1) do
      delete :destroy, id: @fan
    end

    assert_redirected_to fans_path
  end
end
