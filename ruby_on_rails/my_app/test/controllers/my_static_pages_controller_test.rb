require "test_helper"

class MyStaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get my_static_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get my_static_pages_about_url
    assert_response :success
  end

  test "should get help" do
    get my_static_pages_help_url
    assert_response :success
  end

  test "should get contact" do
    get my_static_pages_contact_url
    assert_response :success
  end
end
