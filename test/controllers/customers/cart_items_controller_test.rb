require 'test_helper'

class Customers::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get customers_cart_items_create_url
    assert_response :success
  end

  test "should get index" do
    get customers_cart_items_index_url
    assert_response :success
  end

  test "should get destroy" do
    get customers_cart_items_destroy_url
    assert_response :success
  end

  test "should get all_destroy" do
    get customers_cart_items_all_destroy_url
    assert_response :success
  end

  test "should get update" do
    get customers_cart_items_update_url
    assert_response :success
  end

end
