require 'test_helper'

class FeastsControllerTest < ActionDispatch::IntegrationTest
  test "should get cancel" do
    get feasts_cancel_url
    assert_response :success
  end

  test "should get show" do
    get feasts_show_url
    assert_response :success
  end

  test "should get home" do
    get feasts_home_url
    assert_response :success
  end

  test "should get index" do
    get feasts_index_url
    assert_response :success
  end

  test "should get create" do
    get feasts_create_url
    assert_response :success
  end

end
