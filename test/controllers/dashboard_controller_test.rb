require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get dashboard_home_url
    assert_response :success
  end

  test "should get categories" do
    get dashboard_categories_url
    assert_response :success
  end

  test "should get products" do
    get dashboard_products_url
    assert_response :success
  end

  test "should get users" do
    get dashboard_users_url
    assert_response :success
  end

  test "should get reviews" do
    get dashboard_reviews_url
    assert_response :success
  end

  test "should get orders" do
    get dashboard_orders_url
    assert_response :success
  end

end
