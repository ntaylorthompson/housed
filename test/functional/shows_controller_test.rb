require 'test_helper'

class ShowsControllerTest < ActionController::TestCase
  setup do
    @show = shows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create show" do
    assert_difference('Show.count') do
      post :create, show: { date: @show.date, host: @show.host, host_id: @show.host_id, location: @show.location, musician_id: @show.musician_id, ticket_price: @show.ticket_price, tickets_max: @show.tickets_max, tickets_min: @show.tickets_min }
    end

    assert_redirected_to show_path(assigns(:show))
  end

  test "should show show" do
    get :show, id: @show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @show
    assert_response :success
  end

  test "should update show" do
    put :update, id: @show, show: { date: @show.date, host: @show.host, host_id: @show.host_id, location: @show.location, musician_id: @show.musician_id, ticket_price: @show.ticket_price, tickets_max: @show.tickets_max, tickets_min: @show.tickets_min }
    assert_redirected_to show_path(assigns(:show))
  end

  test "should destroy show" do
    assert_difference('Show.count', -1) do
      delete :destroy, id: @show
    end

    assert_redirected_to shows_path
  end
end
