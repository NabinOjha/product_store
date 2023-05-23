require "test_helper"

class UserOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get user_orders_show_url
    assert_response :success
  end

  test "should get destroy" do
    get user_orders_destroy_url
    assert_response :success
  end

  test "should get update" do
    get user_orders_update_url
    assert_response :success
  end
end
