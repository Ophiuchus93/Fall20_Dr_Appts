require 'test_helper'

class ApptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appts_index_url
    assert_response :success
  end

  test "should get new" do
    get appts_new_url
    assert_response :success
  end

  test "should get create" do
    get appts_create_url
    assert_response :success
  end

  test "should get destroy" do
    get appts_destroy_url
    assert_response :success
  end

end
